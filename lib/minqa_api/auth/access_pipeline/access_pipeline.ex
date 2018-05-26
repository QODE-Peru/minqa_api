defmodule MinqaApi.Auth.AccessPipeline do
  @moduledoc false
  use Guardian.Plug.Pipeline, otp_app: :minqa_api

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
  plug MinqaApi.Auth.AccessPipeline.LoadCurrentAplicacion
end
