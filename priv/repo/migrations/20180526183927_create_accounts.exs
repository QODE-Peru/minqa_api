defmodule MinqaApi.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :card_number, :bigint
      add :password_hash, :string

      timestamps()
    end

  end
end
