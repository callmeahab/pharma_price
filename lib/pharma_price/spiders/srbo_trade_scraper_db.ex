defmodule SrboTradeScraperDB do
  alias PharmaPrice.Vendors.Vendor
  alias PharmaPrice.Spiders.ScrapeItem
  alias PharmaPrice.Products.Product
  use Crawly.Spider
  alias PharmaPrice.Repo
  alias Ecto.Multi

  @impl Crawly.Spider
  def base_url do
    "https://www.apotekasrbotrade.rs"
  end

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "https://www.apotekasrbotrade.rs/srpski/proizvodi/dodaci-ishrani?page=9999",
        "https://www.apotekasrbotrade.rs/srpski/proizvodi/kozmetika-444?page=9999",
        "https://www.apotekasrbotrade.rs/srpski/proizvodi/nega-i-zastita-2?page=9999"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} =
      response.body |> Floki.parse_document()

    vendor = Repo.get_by(Vendor, name: "Srbotrade Apoteka")

    products =
      document
      |> Floki.find(".productItemWrapper")
      |> Enum.map(fn item ->
        item = %ScrapeItem{
          title:
            Floki.find(item, "p")
            |> Floki.text()
            |> String.trim_leading()
            |> String.trim_trailing(),
          price:
            Floki.find(item, ".price")
            |> Floki.text()
            |> String.trim_leading()
            |> String.trim_trailing(),
          link: Floki.find(item, "a") |> Floki.attribute("href") |> Floki.text(),
          image: Floki.find(item, "img") |> Floki.attribute("src") |> Floki.text()
        }

        {price, _} =
          item.price
          |> String.replace(".", "")
          |> String.replace(",", ".")
          |> Float.parse()

        %Product{
          name: item.title,
          price: price,
          url: item.link,
          thumbnail: item.image,
          photos: [item.image],
          vendor: vendor.id
        }
      end)

    Enum.reduce(products, Multi.new(), fn product, multi ->
      Multi.insert(multi, UUID.uuid1(), product)
    end)
    |> Repo.transaction()

    %Crawly.ParsedItem{
      :items => [],
      :requests => []
    }
  end

  def build_absolute_url(url, request_url) do
    URI.merge(request_url, url) |> to_string()
  end
end
