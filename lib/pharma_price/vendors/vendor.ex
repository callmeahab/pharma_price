defmodule PharmaPrice.Vendors.Vendor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vendors" do
    field :name, :string
    field :description, :string
    field :logo, :string
    field :logo_type, :string

    timestamps()
  end

  @doc false
  def changeset(vendor, attrs) do
    vendor
    |> cast(attrs, [:name, :logo, :logo_type, :description])
    |> unique_constraint(:name)
    |> validate_required([:name, :logo, :logo_type, :description])
  end
end
