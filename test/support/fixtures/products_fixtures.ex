defmodule PharmaPrice.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PharmaPrice.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        url: "some url",
        thumbnail: "some thumbnail",
        photos: ["option1", "option2"],
        price: 120.5
      })
      |> PharmaPrice.Products.create_product()

    product
  end
end
