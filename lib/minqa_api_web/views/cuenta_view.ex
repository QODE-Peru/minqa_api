defmodule MinqaApiWeb.CuentaView do
  use MinqaApiWeb, :view
  alias MinqaApiWeb.CuentaView

  def render("index.json", %{cuentas: cuentas}) do
    %{data: render_many(cuentas, CuentaView, "cuenta.json")}
  end

  def render("show.json", %{cuenta: cuenta}) do
    %{data: render_one(cuenta, CuentaView, "cuenta.json")}
  end

  def render("cuenta.json", %{cuenta: cuenta}) do
    %{id: cuenta.id,
      numero: cuenta.numero,
      saldo: cuenta.saldo}
  end
end
