defmodule MinqaApi.Bank.Cuenta do
  use Ecto.Schema
  import Ecto.Changeset
  alias MinqaApi.Bank.Account

  schema "cuentas" do
    field :numero, :string
    field :saldo, :float
    belongs_to :account, Account

    timestamps()
  end

  @doc false
  def changeset(cuenta, attrs) do
    cuenta
    |> cast(attrs, [:numero, :saldo])
    |> validate_required([:numero, :saldo])
    |> unique_constraint(:numero)
  end
end
