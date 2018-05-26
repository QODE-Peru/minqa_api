defmodule MinqaApi.Auth.Aplicacion do
  use Ecto.Schema
  import Ecto.Changeset
  alias MinqaApi.Auth.Aplicacion
  alias Comeonin.Bcrypt

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

  @doc false
  def registration_changeset(%Aplicacion{} = aplicacion, attrs) do
    aplicacion
    |> cast(attrs, [:name, :password])
    |> validate_required([:name, :password])
    |> validate_length(:name, min: 3, max: 15)
    |> validate_length(:password, min: 5)
    |> unique_constraint(:name)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    changeset
    |> put_change(:password_hash, Bcrypt.hashpwsalt(password))
  end
  defp put_pass_hash(changeset), do: changeset
end
