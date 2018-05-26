defmodule MinqaApiWeb.ApiView do
  use MinqaApiWeb, :view
  alias MinqaApiWeb.ApiView

  def render("index.json", %{api: api}) do
    %{data: render_many(api, ApiView, "api.json")}
  end

  def render("show.json", %{api: api}) do
    %{data: render_one(api, ApiView, "api.json")}
  end

  def render("api.json", %{api: api}) do
    %{id: api.id,
      name: api.name}
  end
end
