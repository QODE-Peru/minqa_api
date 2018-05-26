defmodule MinqaApi.Repo.Migrations.CreateCuentas do
  use Ecto.Migration

  def change do
    create table(:cuentas) do
      add :numero, :string
      add :saldo, :float
      add :account_id, references(:accounts, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:cuentas, [:numero])
    create index(:cuentas, [:account_id])
  end
end
