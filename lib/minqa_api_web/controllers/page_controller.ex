defmodule MinqaApiWeb.PageController do
  use MinqaApiWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def api(conn, _params) do
    conn
    |> render("prueba.json")
  end
end
