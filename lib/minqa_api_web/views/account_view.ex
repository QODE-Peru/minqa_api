defmodule MinqaApiWeb.AccountView do
  use MinqaApiWeb, :view
  alias MinqaApi.Bank.Account

  def render("show.html", %{account: %Account{card_number: card_number}}) do
    %{card_number: card_number}
  end
end
