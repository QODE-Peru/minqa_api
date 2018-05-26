defmodule MinqaApiWeb.ApiControllerTest do
  use MinqaApiWeb.ConnCase

  alias MinqaApi.Auth
  alias MinqaApi.Auth.Api

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:api) do
    {:ok, api} = Auth.create_api(@create_attrs)
    api
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all api", %{conn: conn} do
      conn = get conn, api_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create api" do
    test "renders api when data is valid", %{conn: conn} do
      conn = post conn, api_path(conn, :create), api: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, api_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some name"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, api_path(conn, :create), api: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update api" do
    setup [:create_api]

    test "renders api when data is valid", %{conn: conn, api: %Api{id: id} = api} do
      conn = put conn, api_path(conn, :update, api), api: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, api_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "name" => "some updated name"}
    end

    test "renders errors when data is invalid", %{conn: conn, api: api} do
      conn = put conn, api_path(conn, :update, api), api: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete api" do
    setup [:create_api]

    test "deletes chosen api", %{conn: conn, api: api} do
      conn = delete conn, api_path(conn, :delete, api)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, api_path(conn, :show, api)
      end
    end
  end

  defp create_api(_) do
    api = fixture(:api)
    {:ok, api: api}
  end
end
