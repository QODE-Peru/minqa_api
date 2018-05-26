# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MinqaApi.Repo.insert!(%MinqaApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
MinqaApi.Auth.aplicacion_register(%{name: "minqa", password: "123456789"})
{:ok, account} = MinqaApi.Bank.account_register(%{card_number: 1234123412341234, password: 123456})
account |> Ecto.build_assoc(:cuentas, numero: "123-1234567", saldo: 300.00) |> MinqaApi.Repo.insert!()
