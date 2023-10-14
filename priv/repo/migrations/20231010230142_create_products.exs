defmodule PharmaPrice.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :url, :string
      add :thumbnail, :string
      add :photos, {:array, :string}
      add :price, :float
      add :vendor, references(:vendors, on_delete: :nothing)
      add :unit, :string
      add :qty, :string
      add :dosage, :string
      add :dosage_form, :string

      timestamps()
    end

    create index(:products, [:vendor])
  end
end
