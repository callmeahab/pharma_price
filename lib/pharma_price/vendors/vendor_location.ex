defmodule PharmaPrice.Vendors.VendorLocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vendor_locations" do
    field :name, :string
    field :address, :string
    field :lat, :float
    field :lng, :float
    field :city, :string

    timestamps()
  end

  @doc false
  def changeset(vendor_location, attrs) do
    vendor_location
    |> cast(attrs, [:lat, :lng, :address, :name, :city])
    |> validate_required([:lat, :lng, :address, :name, :city])
  end
end
