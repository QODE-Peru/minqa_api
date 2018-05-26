defmodule MinqaApi.Auth.AccessHtmlPipeline do
  @moduledoc false
  use Guardian.Plug.Pipeline, otp_app: :minqa_api

  plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.LoadResource, allow_blank: true
  plug MinqaApi.Auth.AccessHtmlPipeline.LoadCurrentAplicacion
end
