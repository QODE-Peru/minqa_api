defmodule MinqaApi.Auth do
  import Ecto.Query, warn: false

  alias MinqaApi.Repo
  alias MinqaApi.Auth.{Aplicacion, Guardian}
  alias Comeonin.Bcrypt

  @doc """
  Returns the list of aplicaciones.

  ## Examples

      iex> list_aplicaciones()
      [%Aplicacion{}, ...]

  """
  def list_aplicaciones do
    Repo.all(Aplicacion)
  end

  @doc """
  Gets a single aplicacion.

  Raises `Ecto.NoResultsError` if the Aplicacion does not exist.

  ## Examples

      iex> get_aplicacion!(123)
      %Aplicacion{}

      iex> get_aplicacion!(456)
      ** (Ecto.NoResultsError)

  """
  def get_aplicacion!(id), do: Repo.get!(Aplicacion, id)

  @doc """
  Creates a aplicacion.

  ## Examples

      iex> create_aplicacion(%{field: value})
      {:ok, %Aplicacion{}}

      iex> create_aplicacion(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_aplicacion(attrs \\ %{}) do
    %Aplicacion{}
    |> Aplicacion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a aplicacion.

  ## Examples

      iex> update_aplicacion(aplicacion, %{field: new_value})
      {:ok, %Aplicacion{}}

      iex> update_aplicacion(aplicacion, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_aplicacion(%Aplicacion{} = aplicacion, attrs) do
    aplicacion
    |> Aplicacion.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Aplicacion.

  ## Examples

      iex> delete_aplicacion(aplicacion)
      {:ok, %Aplicacion{}}

      iex> delete_aplicacion(aplicacion)
      {:error, %Ecto.Changeset{}}

  """
  def delete_aplicacion(%Aplicacion{} = aplicacion) do
    Repo.delete(aplicacion)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking aplicacion changes.

  ## Examples

      iex> change_aplicacion(aplicacion)
      %Ecto.Changeset{source: %Aplicacion{}}

  """
  def change_aplicacion(%Aplicacion{} = aplicacion) do
    Aplicacion.changeset(aplicacion, %{})
  end

  def change_register_aplicacion(%Aplicacion{} = user) do
    Aplicacion.registration_changeset(user, %{})
  end

  def aplicacion_register(attrs \\ %{}) do
    %Aplicacion{}
    |> Aplicacion.registration_changeset(attrs)
    |> Repo.insert()
  end

  def authenticate_aplicacion(name, plain_text_password) do
    query = from a in Aplicacion, where: a.name == ^name
    Repo.one(query)
    |> check_password(plain_text_password)
  end

  defp check_password(nil, _) do
    Bcrypt.dummy_checkpw()
    {:error, "Aplicacion o contraseña incorrecto"}
  end

  defp check_password(aplicacion, plain_text_password) do
    case Bcrypt.checkpw(plain_text_password, aplicacion.password_hash) do
      true -> {:ok, aplicacion}
      false -> {:error, "Aplicacion o contraseña incorrecto"}
    end
  end

  def login(conn, aplicacion) do
    conn
    |> Guardian.Plug.sign_in(aplicacion)
  end

  def generate_jwt(aplicacion) do
    Guardian.encode_and_sign(aplicacion)
  end

  def logout(conn) do
    conn
    |> Guardian.Plug.sign_out()
  end
end
