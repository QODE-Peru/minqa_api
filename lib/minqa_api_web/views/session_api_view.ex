defmodule MinqaApiWeb.SessionApiView do
  use MinqaApiWeb, :view

  def render("create.json", %{jwt: token, exp: exp}) do
    %{jwt: token, exp: exp}
  end
end
