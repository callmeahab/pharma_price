defmodule PharmaPrice.Repo.Migrations.AddFieldsToVendors do
  use Ecto.Migration

  def change do
    alter table(:vendors) do
      add :email, :string
      add :phone, :string
    end
  end
end
