defmodule PharmaPriceWeb.Layouts do
  use PharmaPriceWeb, :html
  alias PharmaPriceWeb.{DrawerCart, MainMenu, Footer, Header}

  embed_templates "layouts/*"
end
