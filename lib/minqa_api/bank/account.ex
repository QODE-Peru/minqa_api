defmodule MinqaApi.Bank.Account do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt
  alias MinqaApi.Bank.Cuenta

  schema "accounts" do
    field :card_number, :integer, size: 16
    field :password_hash, :string
    field :password, :integer, virtual: true
    has_many :cuentas, Cuenta

    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:card_number, :password])
    |> validate_required([:card_number, :password])
    |> put_pass_hash()
  end

  @doc false
  def registration_changeset(account, attrs) do
    account
    |> cast(attrs, [:card_number, :password])
    |> validate_required([:card_number, :password])
    |> validate_number(:card_number, less_than: 10000000000000000, greater_than: 1000000000000000)
    |> validate_number(:password, less_than: 1000000, greater_than: 0)
    |> unique_constraint(:card_number)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> put_change(:password_hash, Bcrypt.hashpwsalt(Integer.to_string(password)))
  end
  defp put_pass_hash(changeset), do: changeset

end
