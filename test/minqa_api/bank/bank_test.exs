defmodule MinqaApi.BankTest do
  use MinqaApi.DataCase

  alias MinqaApi.Bank

  describe "accounts" do
    alias MinqaApi.Bank.Account

    @valid_attrs %{card_number: 42, password_hash: "some password_hash"}
    @update_attrs %{card_number: 43, password_hash: "some updated password_hash"}
    @invalid_attrs %{card_number: nil, password_hash: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bank.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Bank.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Bank.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Bank.create_account(@valid_attrs)
      assert account.card_number == 42
      assert account.password_hash == "some password_hash"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bank.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, account} = Bank.update_account(account, @update_attrs)
      assert %Account{} = account
      assert account.card_number == 43
      assert account.password_hash == "some updated password_hash"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Bank.update_account(account, @invalid_attrs)
      assert account == Bank.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Bank.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Bank.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Bank.change_account(account)
    end
  end

  describe "cuentas" do
    alias MinqaApi.Bank.Cuenta

    @valid_attrs %{numero: "some numero", saldo: 120.5}
    @update_attrs %{numero: "some updated numero", saldo: 456.7}
    @invalid_attrs %{numero: nil, saldo: nil}

    def cuenta_fixture(attrs \\ %{}) do
      {:ok, cuenta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Bank.create_cuenta()

      cuenta
    end

    test "list_cuentas/0 returns all cuentas" do
      cuenta = cuenta_fixture()
      assert Bank.list_cuentas() == [cuenta]
    end

    test "get_cuenta!/1 returns the cuenta with given id" do
      cuenta = cuenta_fixture()
      assert Bank.get_cuenta!(cuenta.id) == cuenta
    end

    test "create_cuenta/1 with valid data creates a cuenta" do
      assert {:ok, %Cuenta{} = cuenta} = Bank.create_cuenta(@valid_attrs)
      assert cuenta.numero == "some numero"
      assert cuenta.saldo == 120.5
    end

    test "create_cuenta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bank.create_cuenta(@invalid_attrs)
    end

    test "update_cuenta/2 with valid data updates the cuenta" do
      cuenta = cuenta_fixture()
      assert {:ok, cuenta} = Bank.update_cuenta(cuenta, @update_attrs)
      assert %Cuenta{} = cuenta
      assert cuenta.numero == "some updated numero"
      assert cuenta.saldo == 456.7
    end

    test "update_cuenta/2 with invalid data returns error changeset" do
      cuenta = cuenta_fixture()
      assert {:error, %Ecto.Changeset{}} = Bank.update_cuenta(cuenta, @invalid_attrs)
      assert cuenta == Bank.get_cuenta!(cuenta.id)
    end

    test "delete_cuenta/1 deletes the cuenta" do
      cuenta = cuenta_fixture()
      assert {:ok, %Cuenta{}} = Bank.delete_cuenta(cuenta)
      assert_raise Ecto.NoResultsError, fn -> Bank.get_cuenta!(cuenta.id) end
    end

    test "change_cuenta/1 returns a cuenta changeset" do
      cuenta = cuenta_fixture()
      assert %Ecto.Changeset{} = Bank.change_cuenta(cuenta)
    end
  end
end
