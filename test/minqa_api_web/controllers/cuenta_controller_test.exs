defmodule MinqaApiWeb.CuentaControllerTest do
  use MinqaApiWeb.ConnCase

  alias MinqaApi.Bank
  alias MinqaApi.Bank.Cuenta

  @create_attrs %{numero: "some numero", saldo: 120.5}
  @update_attrs %{numero: "some updated numero", saldo: 456.7}
  @invalid_attrs %{numero: nil, saldo: nil}

  def fixture(:cuenta) do
    {:ok, cuenta} = Bank.create_cuenta(@create_attrs)
    cuenta
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all cuentas", %{conn: conn} do
      conn = get conn, cuenta_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cuenta" do
    test "renders cuenta when data is valid", %{conn: conn} do
      conn = post conn, cuenta_path(conn, :create), cuenta: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, cuenta_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "numero" => "some numero",
        "saldo" => 120.5}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cuenta_path(conn, :create), cuenta: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cuenta" do
    setup [:create_cuenta]

    test "renders cuenta when data is valid", %{conn: conn, cuenta: %Cuenta{id: id} = cuenta} do
      conn = put conn, cuenta_path(conn, :update, cuenta), cuenta: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, cuenta_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "numero" => "some updated numero",
        "saldo" => 456.7}
    end

    test "renders errors when data is invalid", %{conn: conn, cuenta: cuenta} do
      conn = put conn, cuenta_path(conn, :update, cuenta), cuenta: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cuenta" do
    setup [:create_cuenta]

    test "deletes chosen cuenta", %{conn: conn, cuenta: cuenta} do
      conn = delete conn, cuenta_path(conn, :delete, cuenta)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, cuenta_path(conn, :show, cuenta)
      end
    end
  end

  defp create_cuenta(_) do
    cuenta = fixture(:cuenta)
    {:ok, cuenta: cuenta}
  end
end
