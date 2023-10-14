defmodule ApotekaOnlineScraper do
  alias PharmaPrice.Spiders.ScrapeItem
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url do
    "https://www.apoteka-online.rs"
  end

  @impl Crawly.Spider
  def init() do
    [
      start_urls: [
        "https://www.apoteka-online.rs/catalog/kozmetika-33/p",
        "https://www.apoteka-online.rs/catalog/imunitet-14/p",
        "https://www.apoteka-online.rs/catalog/bebe-i-deca-19/p",
        "https://www.apoteka-online.rs/catalog/vitamini-i-minerali-18/p",
        "https://www.apoteka-online.rs/catalog/trudnoca-i-dojenje-22/p",
        "https://www.apoteka-online.rs/catalog/kosa-nokti-koza-10/p",
        "https://www.apoteka-online.rs/catalog/zdravlje-srca-i-krvnih-sudova-8/p",
        "https://www.apoteka-online.rs/catalog/zdravlje-zene-9/p",
        "https://www.apoteka-online.rs/catalog/flasteri-80/p",
        "https://www.apoteka-online.rs/catalog/poklon-paketi-66/p",
        "https://www.apoteka-online.rs/catalog/promo-pakovanja-85/p",
        "https://www.apoteka-online.rs/catalog/zdravlje-muskarca-potencija-prostata-20/p",
        "https://www.apoteka-online.rs/catalog/sve-po-119-dinara-61/p",
        "https://www.apoteka-online.rs/catalog/zdrav-zivot-62/p",
        "https://www.apoteka-online.rs/catalog/hrana-za-posebne-namene-108/p",
        "https://www.apoteka-online.rs/catalog/za-sportiste-99/p",
        "https://www.apoteka-online.rs/catalog/uho-grlo-nos-12/p",
        "https://www.apoteka-online.rs/catalog/zdravlje-mokracnih-kanala-28/p",
        "https://www.apoteka-online.rs/catalog/varenje-i-metabolizam-16/p",
        "https://www.apoteka-online.rs/catalog/mrsavljenje-17/p",
        "https://www.apoteka-online.rs/catalog/kosti-misici-i-zglobovi-21/p",
        "https://www.apoteka-online.rs/catalog/pamcenje-koncentracija-bol-29/p",
        "https://www.apoteka-online.rs/catalog/stres-i-nesanica-15/p",
        "https://www.apoteka-online.rs/catalog/kapi-za-oci-i-rastvori-za-sociva-23/p",
        "https://www.apoteka-online.rs/catalog/oralna-higijena-27/p",
        "https://www.apoteka-online.rs/catalog/prezervativi-i-lubrikanti-48/p",
        "https://www.apoteka-online.rs/catalog/razno-51/p",
        "https://www.apoteka-online.rs/catalog/testovi-54/p",
        "https://www.apoteka-online.rs/catalog/aromaterapija-i-biljna-ulja-55/p",
        "https://www.apoteka-online.rs/catalog/promo-cene-hemofarm-84/p",
        "https://www.apoteka-online.rs/catalog/meraci-pritiska-inhalatori-toplomeri-56/p"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(response) do
    {:ok, document} =
      response.body |> Floki.parse_document()

    items =
      document
      |> Floki.find(".product.product--grid")
      |> Enum.filter(&not_has_offStock/1)
      |> Enum.map(fn item ->
        title =
          Floki.find(item, ".product__name")
          |> Floki.text()
          |> String.trim_leading()
          |> String.trim_trailing()

        price =
          Floki.find(item, ".product__info.product__info--price-gross")
          |> Floki.text()
          |> String.trim_leading()
          |> String.trim_trailing()

        link =
          Floki.find(item, ".grid-image__link") |> Floki.attribute("href") |> Floki.text()

        image =
          Floki.find(item, ".grid-image__image-wrapper > img")
          |> Floki.attribute("data-src")
          |> Floki.text()

        %ScrapeItem{title: title, price: price, link: link, image: image}
      end)

    %Crawly.ParsedItem{
      :items => items,
      :requests => []
    }
  end

  def build_absolute_url(url, request_url) do
    URI.merge(request_url, url) |> to_string()
  end

  defp not_has_offStock(item) do
    # Use pattern matching to check if the item contains ".offStock"
    case Floki.find(item, ".grid-image.grid-image--out-of-stock") do
      [] -> true
      _ -> false
    end
  end
end
