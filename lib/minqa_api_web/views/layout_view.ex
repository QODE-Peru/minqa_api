defmodule MinqaApiWeb.LayoutView do
  use MinqaApiWeb, :view

  defp aplicacion_o_login(conn, nil), do: link("Login", to: session_path(conn, :new))
  defp aplicacion_o_login(conn, current_aplicacion), do: render "usuario.html", name: current_aplicacion.name, conn: conn

end
