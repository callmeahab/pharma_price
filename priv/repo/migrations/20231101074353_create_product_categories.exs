defmodule PharmaPrice.Repo.Migrations.CreateProductCategories do
  use Ecto.Migration

  def change do
    create table(:product_categories) do
      add :name, :string
      add :description, :string
      add :logo, :string

      timestamps()
    end
  end
end
