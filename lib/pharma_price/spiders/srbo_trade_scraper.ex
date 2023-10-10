defmodule PharmaPrice.Spiders.SrboTradeScraper do
  alias PharmaPrice.Spiders.ScrapeItem
  use Crawly.Spider

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

    items =
      document
      |> Floki.find(".productItemWrapper")
      |> Enum.map(fn item ->
        %ScrapeItem{
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
      end)

    # # Getting search result urls
    # urls =
    #   document
    #   |> Floki.find("div.s-result-list a.a-link-normal")
    #   |> Floki.attribute("href")

    # # Convert URLs into requests
    # requests =
    #   Enum.map(urls, fn url ->
    #     url
    #     |> build_absolute_url(response.request_url)
    #     |> Crawly.Utils.request_from_url()
    #   end)

    # name =
    #   document
    #   |> Floki.find("span#productTitle")
    #   |> Floki.text()

    # price =
    #   document
    #   |> Floki.find(".a-box-group span.a-price span.a-offscreen")
    #   |> Floki.text()
    #   |> String.trim_leading()
    #   |> String.trim_trailing()

    # %Crawly.ParsedItem{
    #   :requests => requests,
    #   :items => [
    #     %{name: name, price: price, url: response.request_url}
    #   ]
    # }

    %Crawly.ParsedItem{
      :items => items,
      :requests => []
    }
  end

  def build_absolute_url(url, request_url) do
    URI.merge(request_url, url) |> to_string()
  end
end
