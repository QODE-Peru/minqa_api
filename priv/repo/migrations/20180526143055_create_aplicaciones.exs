defmodule MinqaApi.Repo.Migrations.CreateAplicaciones do
  use Ecto.Migration

  def change do
    create table(:aplicaciones) do
      add :name, :string
      add :password_hash, :string

      timestamps()
    end

  end
end
