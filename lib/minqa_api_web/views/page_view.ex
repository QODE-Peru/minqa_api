defmodule MinqaApiWeb.PageView do
  use MinqaApiWeb, :view

  def render("prueba.json", assigns) do
    IO.inspect(assigns.current_aplicacion)
    %{mensaje: "holi"}
  end
end
