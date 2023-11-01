defmodule PharmaPrice.Repo.Migrations.CreateVendorLocations do
  use Ecto.Migration

  def change do
    create table(:vendor_locations) do
      add :lat, :float
      add :lng, :float
      add :address, :string
      add :name, :string
      add :city, :string

      timestamps()
    end
  end
end
