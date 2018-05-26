defmodule MinqaApi.Auth.AccessApiPipeline.LoadCurrentAplicacion do
  import Plug.Conn
  alias MinqaApi.Auth.Guardian

  def init([]), do: false
  def call(conn, _opts) do
    conn
    |> assign(:current_aplicacion, Guardian.Plug.current_resource(conn))
  end
end
