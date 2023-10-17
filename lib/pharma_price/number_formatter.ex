defmodule PharmaPrice.Cldr do
  use Cldr,
    locales: [:de],
    providers: [Cldr.Number]
end
