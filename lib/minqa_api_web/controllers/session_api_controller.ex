defmodule MinqaApiWeb.SessionApiController do
  use MinqaApiWeb, :controller

  def create(conn, %{"name" => name, "password" => password}) do
    case MinqaApi.Auth.authenticate_aplicacion(name, password) do
      {:ok, aplicacion} ->
        {:ok, token, claims} = MinqaApi.Auth.generate_jwt(aplicacion)
        exp = Map.get(claims, "exp")
        conn
        |> render("create.json", jwt: token, exp: exp)
      {:error, _reason} ->
         conn
         |> put_status(401)
         |> render(MinqaApiWeb.ErrorView, :"401")
    end
  end

  def create(conn, params) do
    conn
    |> put_status(:not_found)
    |> json(%{error: "bad request"})
  end
end
