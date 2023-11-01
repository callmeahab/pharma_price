defmodule PharmaPrice.Products.ProductCategories do
  use Ecto.Schema
  import Ecto.Changeset

  schema "product_categories" do
    field :name, :string
    field :description, :string
    field :logo, :string

    timestamps()
  end

  @doc false
  def changeset(product_categories, attrs) do
    product_categories
    |> cast(attrs, [:name, :description, :logo])
    |> validate_required([:name, :description, :logo])
  end
end
