defmodule MinqaApi.Auth.Api do
  use Ecto.Schema
  import Ecto.Changeset


  schema "api" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(api, attrs) do
    api
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
