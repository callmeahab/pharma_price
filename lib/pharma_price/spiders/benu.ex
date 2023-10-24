defmodule BenuScraper do
  alias PharmaPrice.Spiders.ScrapeItem
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url do
    "https://benu.rs"
  end

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "https://benu.rs/dijetetski-suplementi",
        "https://benu.rs/dermokozmetika",
        "https://benu.rs/mame-bebe-i-deca",
        "https://benu.rs/higijena-nega-i-kozmetika",
        "https://benu.rs/medicinska-oprema-i-materijali",
        "https://benu.rs/zdrava-hrana-cajevi-i-biljni-preparati"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} =
      response.body |> Floki.parse_document()

    items =
      document
      |> Floki.find("section.product-box")
      |> Enum.map(fn item ->
        title =
          Floki.find(item, "h2.product-box__name")
          |> Floki.text()
          |> String.trim_leading()
          |> String.trim_trailing()

        price =
          Floki.find(item, "strong.u-pos-r")
          |> Floki.text()
          |> String.trim_leading()
          |> String.trim_trailing()

        link =
          "#{base_url()}#{Floki.find(item, "a.product-box__link") |> Floki.attribute("href") |> Floki.text()}"

        image =
          "#{base_url()}#{Floki.find(item, "img") |> Floki.attribute("src") |> Floki.text()}"

        %ScrapeItem{title: title, price: price, link: link, image: image}
      end)

    %Crawly.ParsedItem{
      :items => items,
      :requests => build_next_page_request(document)
    }
  end

  def build_next_page_request(document) do
    next_page_button = Floki.find(document, "a.btn.btn-misc.next")

    if next_page_button == [] do
      []
    else
      url = "#{base_url()}#{Floki.attribute(List.first(next_page_button), "href")}"
      [Crawly.Request.new(url: url, callback: :parse_item)]
    end
  end
end
