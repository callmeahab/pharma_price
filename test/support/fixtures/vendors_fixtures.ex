defmodule PharmaPrice.VendorsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PharmaPrice.Vendors` context.
  """

  @doc """
  Generate a vendor.
  """
  def vendor_fixture(attrs \\ %{}) do
    {:ok, vendor} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        logo: "some logo",
        logo_type: "some logo_type"
      })
      |> PharmaPrice.Vendors.create_vendor()

    vendor
  end
end
