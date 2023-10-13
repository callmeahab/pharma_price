defmodule SrboTradeScraper do
  alias PharmaPrice.Spiders.ScrapeItem
  use Crawly.Spider

  @csv_file_path "srbo_trade_output.csv"

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
      |> Enum.filter(&not_has_offStock/1)
      |> Enum.map(fn item ->
        title =
          Floki.find(item, "p.title")
          |> Floki.text()
          |> String.trim_leading()
          |> String.trim_trailing()

        price =
          Floki.find(item, ".price")
          |> Floki.text()
          |> String.trim_leading()
          |> String.trim_trailing()

        link =
          "#{base_url()}/#{Floki.find(item, "a:not([class])") |> Floki.attribute("href") |> Floki.text()}"

        image =
          "#{base_url()}/#{Floki.find(item, "img") |> Floki.attribute("src") |> Floki.text()}"

        %ScrapeItem{title: title, price: price, link: link, image: image}
      end)

    %Crawly.ParsedItem{
      :items => items,
      :requests => []
    }
  end

  defp not_has_offStock(item) do
    # Use pattern matching to check if the item contains ".offStock"
    case Floki.find(item, ".offStock") do
      [] -> true
      _ -> false
    end
  end
end
