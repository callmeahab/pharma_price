defmodule PharmaPrice.Repo.Migrations.CreateVendors do
  use Ecto.Migration

  def change do
    create table(:vendors) do
      add :name, :string, required: true
      add :logo, :string
      add :logo_type, :string
      add :description, :string

      timestamps()
    end

    create unique_index(:vendors, [:name])
  end
end
