defmodule PharmaPrice.Spiders.ScrapeItem do
  defstruct(title: nil, price: nil, link: nil, image: nil)
end

alias PharmaPrice.Spiders.ScrapeItem

defimpl CSV.Encode, for: ScrapeItem do
  def encode(%ScrapeItem{title: title, price: price, link: link, image: image}, env \\ []) do
    "#{title},#{price},#{link},#{image}" |> CSV.Encode.encode(env)
  end
end

defimpl String.Chars, for: ScrapeItem do
  def to_string(%ScrapeItem{title: title, price: price, link: link, image: image}) do
    "#{title},#{price},#{link},#{image}"
  end
end
