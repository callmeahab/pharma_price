defmodule PharmaPrice.Repo.Migrations.ProductLocations do
  use Ecto.Migration

  def change do
    create table(:product_locations) do
      add :product_id, references("products")
      add :vendor_id, references("vendors")
      add :location_id, references("vendor_locations")
    end
  end
end
