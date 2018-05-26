defmodule MinqaApi.AuthTest do
  use MinqaApi.DataCase

  alias MinqaApi.Auth

  describe "aplicaciones" do
    alias MinqaApi.Auth.Aplicacion

    @valid_attrs %{name: "some name", password_hash: "some password_hash"}
    @update_attrs %{name: "some updated name", password_hash: "some updated password_hash"}
    @invalid_attrs %{name: nil, password_hash: nil}

    def aplicacion_fixture(attrs \\ %{}) do
      {:ok, aplicacion} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_aplicacion()

      aplicacion
    end

    test "list_aplicaciones/0 returns all aplicaciones" do
      aplicacion = aplicacion_fixture()
      assert Auth.list_aplicaciones() == [aplicacion]
    end

    test "get_aplicacion!/1 returns the aplicacion with given id" do
      aplicacion = aplicacion_fixture()
      assert Auth.get_aplicacion!(aplicacion.id) == aplicacion
    end

    test "create_aplicacion/1 with valid data creates a aplicacion" do
      assert {:ok, %Aplicacion{} = aplicacion} = Auth.create_aplicacion(@valid_attrs)
      assert aplicacion.name == "some name"
      assert aplicacion.password_hash == "some password_hash"
    end

    test "create_aplicacion/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_aplicacion(@invalid_attrs)
    end

    test "update_aplicacion/2 with valid data updates the aplicacion" do
      aplicacion = aplicacion_fixture()
      assert {:ok, aplicacion} = Auth.update_aplicacion(aplicacion, @update_attrs)
      assert %Aplicacion{} = aplicacion
      assert aplicacion.name == "some updated name"
      assert aplicacion.password_hash == "some updated password_hash"
    end

    test "update_aplicacion/2 with invalid data returns error changeset" do
      aplicacion = aplicacion_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_aplicacion(aplicacion, @invalid_attrs)
      assert aplicacion == Auth.get_aplicacion!(aplicacion.id)
    end

    test "delete_aplicacion/1 deletes the aplicacion" do
      aplicacion = aplicacion_fixture()
      assert {:ok, %Aplicacion{}} = Auth.delete_aplicacion(aplicacion)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_aplicacion!(aplicacion.id) end
    end

    test "change_aplicacion/1 returns a aplicacion changeset" do
      aplicacion = aplicacion_fixture()
      assert %Ecto.Changeset{} = Auth.change_aplicacion(aplicacion)
    end
  end

  describe "api" do
    alias MinqaApi.Auth.Api

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def api_fixture(attrs \\ %{}) do
      {:ok, api} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Auth.create_api()

      api
    end

    test "list_api/0 returns all api" do
      api = api_fixture()
      assert Auth.list_api() == [api]
    end

    test "get_api!/1 returns the api with given id" do
      api = api_fixture()
      assert Auth.get_api!(api.id) == api
    end

    test "create_api/1 with valid data creates a api" do
      assert {:ok, %Api{} = api} = Auth.create_api(@valid_attrs)
      assert api.name == "some name"
    end

    test "create_api/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_api(@invalid_attrs)
    end

    test "update_api/2 with valid data updates the api" do
      api = api_fixture()
      assert {:ok, api} = Auth.update_api(api, @update_attrs)
      assert %Api{} = api
      assert api.name == "some updated name"
    end

    test "update_api/2 with invalid data returns error changeset" do
      api = api_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_api(api, @invalid_attrs)
      assert api == Auth.get_api!(api.id)
    end

    test "delete_api/1 deletes the api" do
      api = api_fixture()
      assert {:ok, %Api{}} = Auth.delete_api(api)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_api!(api.id) end
    end

    test "change_api/1 returns a api changeset" do
      api = api_fixture()
      assert %Ecto.Changeset{} = Auth.change_api(api)
    end
  end
end
