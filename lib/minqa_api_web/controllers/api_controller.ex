defmodule MinqaApiWeb.ApiController do
  use MinqaApiWeb, :controller

  alias MinqaApi.Auth
  alias MinqaApi.Auth.Api

  action_fallback MinqaApiWeb.FallbackController

  def index(conn, _params) do
    api = Auth.list_api()
    render(conn, "index.json", api: api)
  end

  def create(conn, %{"api" => api_params}) do
    with {:ok, %Api{} = api} <- Auth.create_api(api_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", api_path(conn, :show, api))
      |> render("show.json", api: api)
    end
  end

  def show(conn, %{"id" => id}) do
    api = Auth.get_api!(id)
    render(conn, "show.json", api: api)
  end

  def update(conn, %{"id" => id, "api" => api_params}) do
    api = Auth.get_api!(id)

    with {:ok, %Api{} = api} <- Auth.update_api(api, api_params) do
      render(conn, "show.json", api: api)
    end
  end

  def delete(conn, %{"id" => id}) do
    api = Auth.get_api!(id)
    with {:ok, %Api{}} <- Auth.delete_api(api) do
      send_resp(conn, :no_content, "")
    end
  end
end
