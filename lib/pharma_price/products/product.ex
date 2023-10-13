defmodule PharmaPrice.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :url, :string
    field :thumbnail, :string
    field :photos, {:array, :string}
    field :price, :float
    field :vendor, :id
    field :unit, :string
    field :qty, :string
    field :dosage, :string
    field :dosage_form, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [
      :name,
      :url,
      :thumbnail,
      :photos,
      :price,
      :vendor,
      :unit,
      :qty,
      :dosage,
      :dosage_form
    ])
    |> validate_required([:name, :url, :thumbnail, :photos, :price, :vendor])
  end
end
