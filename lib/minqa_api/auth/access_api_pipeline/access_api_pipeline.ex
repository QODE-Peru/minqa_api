defmodule MinqaApi.Auth.AccessApiPipeline do
  @moduledoc false
  use Guardian.Plug.Pipeline, otp_app: :minqa_api

  plug Guardian.Plug.VerifyHeader, realm: "Bearer"
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource
  plug MinqaApi.Auth.AccessApiPipeline.LoadCurrentAplicacion
end
