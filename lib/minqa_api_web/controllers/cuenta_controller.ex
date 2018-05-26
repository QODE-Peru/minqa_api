defmodule MinqaApiWeb.CuentaController do
  use MinqaApiWeb, :controller

  alias MinqaApi.Bank
  alias MinqaApi.Bank.Cuenta

  action_fallback MinqaApiWeb.FallbackController

  def index(conn, _params) do
    cuentas = Bank.list_cuentas()
    render(conn, "index.json", cuentas: cuentas)
  end

  def create(conn, %{"cuenta" => cuenta_params}) do
    with {:ok, %Cuenta{} = cuenta} <- Bank.create_cuenta(cuenta_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", cuenta_path(conn, :show, cuenta))
      |> render("show.json", cuenta: cuenta)
    end
  end

  def show(conn, %{"id" => id}) do
    cuenta = Bank.get_cuenta!(id)
    render(conn, "show.json", cuenta: cuenta)
  end

  def update(conn, %{"id" => id, "cuenta" => cuenta_params}) do
    cuenta = Bank.get_cuenta!(id)

    with {:ok, %Cuenta{} = cuenta} <- Bank.update_cuenta(cuenta, cuenta_params) do
      render(conn, "show.json", cuenta: cuenta)
    end
  end

  def delete(conn, %{"id" => id}) do
    cuenta = Bank.get_cuenta!(id)
    with {:ok, %Cuenta{}} <- Bank.delete_cuenta(cuenta) do
      send_resp(conn, :no_content, "")
    end
  end
end
