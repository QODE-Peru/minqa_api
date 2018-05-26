defmodule MinqaApi.Auth.Guardian do
  use Guardian, otp_app: :minq_api

  alias MinqaApi.Auth
  alias MinqaApi.Auth.Aplicacion

  def subject_for_token(%Aplicacion{} = aplicacion, _claims) do
    {:ok, to_string(aplicacion.id)}
  end

  def subject_for_token(_, _) do
    {:error, :error}
  end

  def resource_from_claims(claims) do
    aplicacion = claims["sub"]
    |> Auth.get_aplicacion!
    {:ok, aplicacion}
  end

end
