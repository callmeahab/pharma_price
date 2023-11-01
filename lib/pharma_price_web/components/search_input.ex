defmodule PharmaPriceWeb.SearchInput do
  use PharmaPriceWeb, :html

  def main(assigns) do
    ~H"""
    <.form
      :let={f}
      phx-change="search"
      phx-submit="search"
      for={%{}}
      as={:search}
      novalidate=""
      role="search"
      class="items-center justify-center w-full lg:max-w-screen-md rounded relative overflow-hidden hidden lg:flex"
    >
      <.search_input
        type="search"
        name="search"
        field={f[:q]}
        value={@q}
        phx-change="search"
        id="search-normal"
        placeholder="Search your medicine here"
        class="w-full h-12 pl-12 px-4 text-gray-900 placeholder-gray-700 bg-white border-2 border-black rounded outline-none transition duration-200 focus:border-black focus:placeholder-gray-900"
      />
    </.form>
    """
  end
end
