defmodule PharmaPrice.Repo.Migrations.AddProductDescription do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :description, :string
    end
  end
end
