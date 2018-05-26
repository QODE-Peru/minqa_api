defmodule MinqaApiWeb.AccountController do
  use MinqaApiWeb, :controller

  alias MinqaApi.Bank

  action_fallback MinqaApiWeb.FallbackController

  def show(conn, %{"card_number" => card_number, "password" => password}) do
    case MinqaApi.Bank.authenticate_account(card_number, password) do
      {:ok, account} ->
        account = account
        |> Bank.preload_cuentas()
        conn
        |> render("show.html", account: account)
      {:error, _reason} ->
         conn
         |> put_status(401)
         |> render(MinqaApiWeb.ErrorView, :"401")
    end
  end
end
