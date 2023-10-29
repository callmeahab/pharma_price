defmodule PharmaPrice.Search do
  import Ecto.Query
  alias PharmaPrice.Repo

  def create_index do
    Meilisearch.Indexes.create("products_index")
    products = Repo.all(from p in "products", select: %{id: p.id, name: p.name, price: p.price})
    Meilisearch.Documents.add_or_replace("products_index", products)
  end
end
