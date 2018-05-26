defmodule MinqaApi.Bank do
  @moduledoc """
  The Bank context.
  """

  import Ecto.Query, warn: false
  alias MinqaApi.Repo
  alias Comeonin.Bcrypt

  alias MinqaApi.Bank.Account

  @doc """
  Returns the list of accounts.

  ## Examples

      iex> list_accounts()
      [%Account{}, ...]

  """
  def list_accounts do
    Repo.all(Account)
  end


  @doc """
  Gets a single account.

  Raises `Ecto.NoResultsError` if the Account does not exist.

  ## Examples

      iex> get_account!(123)
      %Account{}

      iex> get_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account!(id), do: Repo.get!(Account, id)

  @doc """
  Creates a account.

  ## Examples

      iex> create_account(%{field: value})
      {:ok, %Account{}}

      iex> create_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account.

  ## Examples

      iex> update_account(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update_account(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Account.

  ## Examples

      iex> delete_account(account)
      {:ok, %Account{}}

      iex> delete_account(account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change_account(account)
      %Ecto.Changeset{source: %Account{}}

  """
  def change_account(%Account{} = account) do
    Account.changeset(account, %{})
  end

  def change_register_aplicacion(%Account{} = account) do
    Account.registration_changeset(account, %{})
  end

  def account_register(attrs \\ %{}) do
    %Account{}
    |> Account.registration_changeset(attrs)
    |> Repo.insert()
  end

  def authenticate_account(card_number, plain_text_password) do
    query = from a in Account, where: a.card_number == ^card_number
    Repo.one(query)
    |> check_password(plain_text_password)
  end

  defp check_password(nil, _) do
    Bcrypt.dummy_checkpw()
    {:error, "Tarjeta o contraseña incorrecta"}
  end

  defp check_password(account, plain_text_password) do
    case Bcrypt.checkpw(plain_text_password, account.password_hash) do
      true -> {:ok, account}
      false -> {:error, "Tarjeta o contraseña incorrecta"}
    end
  end

  alias MinqaApi.Bank.Cuenta

  @doc """
  Returns the list of cuentas.

  ## Examples

      iex> list_cuentas()
      [%Cuenta{}, ...]

  """
  def list_cuentas do
    Repo.all(Cuenta)
  end

  @doc """
  Gets a single cuenta.

  Raises `Ecto.NoResultsError` if the Cuenta does not exist.

  ## Examples

      iex> get_cuenta!(123)
      %Cuenta{}

      iex> get_cuenta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cuenta!(id), do: Repo.get!(Cuenta, id)

  @doc """
  Creates a cuenta.

  ## Examples

      iex> create_cuenta(%{field: value})
      {:ok, %Cuenta{}}

      iex> create_cuenta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cuenta(attrs \\ %{}) do
    %Cuenta{}
    |> Cuenta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cuenta.

  ## Examples

      iex> update_cuenta(cuenta, %{field: new_value})
      {:ok, %Cuenta{}}

      iex> update_cuenta(cuenta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cuenta(%Cuenta{} = cuenta, attrs) do
    cuenta
    |> Cuenta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cuenta.

  ## Examples

      iex> delete_cuenta(cuenta)
      {:ok, %Cuenta{}}

      iex> delete_cuenta(cuenta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cuenta(%Cuenta{} = cuenta) do
    Repo.delete(cuenta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cuenta changes.

  ## Examples

      iex> change_cuenta(cuenta)
      %Ecto.Changeset{source: %Cuenta{}}

  """
  def change_cuenta(%Cuenta{} = cuenta) do
    Cuenta.changeset(cuenta, %{})
  end

  def preload_cuentas(%Account{} = account) do
    account
    |> Repo.preload(:cuentas)
  end
end
