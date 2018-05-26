defmodule MinqaApi.Auth.Aplicacion do
  use Ecto.Schema
  import Ecto.Changeset


  schema "aplicaciones" do
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(aplicacion, attrs) do
    aplicacion
    |> cast(attrs, [:name, :password_hash])
    |> validate_required([:name, :password_hash])
  end
end
