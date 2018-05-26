defmodule MinqaApiWeb.SessionController do
  use MinqaApiWeb, :controller
  alias MinqaApi.Auth
  alias MinqaApi.Auth.Aplicacion

  def new(conn, _params) do
    changeset = Auth.change_register_aplicacion(%Aplicacion{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"aplicacion" => %{"name" => name, "password" => password} = aplicacion_params}) do
    case MinqaApi.Auth.authenticate_aplicacion(name, password) do
      {:ok, aplicacion} ->
        conn
        |> MinqaApi.Auth.login(aplicacion)
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :index))

       {:error, reason} ->
         changeset = Aplicacion.registration_changeset(%Aplicacion{}, aplicacion_params)
         conn
         |> put_flash(:error, reason)
         |> render("new.html", changeset: changeset)
    end
  end

  def delete(conn, _params) do
    conn
    |> MinqaApi.Auth.logout
    |> redirect(to: page_path(conn, :index))
  end
end
