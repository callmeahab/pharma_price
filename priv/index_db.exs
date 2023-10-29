import Ecto.Query
alias PharmaPrice.Repo
alias PharmaPrice.Products.Product


Meilisearch.Indexes.create("products_index")

products = Repo.all(Product)

Meilisearch.Documents.add_or_replace("products_index", products)

# response = HTTPoison.post!("http://localhost:7700/indexes/products_index/search", Jason.encode!(%{q: "caj"}), [
#   {"Content-Type", "application/json"}
# ])

# body = Jason.decode!(response.body)
# |> IO.inspect()

# response = HTTPoison.post!(
#   "http://localhost:7700/indexes/products_index/search",
#   Jason.encode!(%{q: "caj", offset: 20}),
#   [
#     {"Content-Type", "application/json"}
#   ]
# )

# body = Jason.decode!(response.body)
# |> IO.inspect()

# Meilisearch.Search.search("products_index", "caj")
# |> IO.inspect()
