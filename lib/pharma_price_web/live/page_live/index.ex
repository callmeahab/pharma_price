defmodule PharmaPriceWeb.PageLive.Index do
  alias PharmaPrice.Products
  alias PharmaPriceWeb.{SearchHeader, ItemCard, ItemDetails, HeroInfo}
  use PharmaPriceWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    selected_item = nil
    cart = %{}

    {:ok,
     socket
     |> assign(:items, Products.list_products())
     |> assign(:selected_item, selected_item)
     |> assign(:cart, cart)
     |> assign(:q, nil)
     |> assign(:search_results, [])}
  end

  @impl true
  def handle_event("inc_count", %{"id" => id}, socket) do
    {id, _} = Integer.parse(id)

    cart =
      case Map.get(socket.assigns.cart, id) do
        nil ->
          socket.assigns.cart |> Map.put(id, %{"count" => 1})

        item ->
          %{
            socket.assigns.cart
            | id => %{
                item
                | "count" => item["count"] + 1
              }
          }
      end

    {:noreply, assign(socket, :cart, cart)}
  end

  @impl true
  def handle_event("dec_count", %{"id" => id}, socket) do
    {id, _} = Integer.parse(id)

    cart =
      case Map.get(socket.assigns.cart, id) do
        nil ->
          socket.assigns.cart

        item ->
          if item["count"] > 0 do
            %{socket.assigns.cart | id => %{item | "count" => item["count"] - 1}}
          else
            socket.assings.cart
          end
      end

    {:noreply, assign(socket, :cart, cart)}
  end

  @impl true
  def handle_event("search", %{"search" => q}, socket) do
    {:ok, results} =
      Meilisearch.Search.search("products_index", q)

    results =
      results["hits"]
      |> Enum.map(fn r -> r |> Map.new(fn {k, v} -> {String.to_atom(k), v} end) end)

    {:noreply, socket |> assign(:search_results, results)}
  end

  @impl true
  def handle_event("select_item", %{"id" => id}, socket) do
    {:noreply, socket |> assign(:selected_item, Products.get_product!(id))}
  end

  @impl true
  def handle_event("deselect_item", _value, socket) do
    {:noreply, socket |> assign(:selected_item, nil)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <SearchHeader.render q={@q} />
    <HeroInfo.render :if={length(@search_results) == 0} />
    <ItemDetails.render
      :if={@selected_item}
      phx-mounted={
        JS.show(
          to: "#drawer-item-details",
          display: "flex",
          transition:
            {"transition-all transform ease-out duration-200", "translate-x-full",
             "translate-x-full - 450px"},
          time: 200
        )
      }
      phx-remove={
        JS.hide(
          to: "#drawer-item-details",
          transition:
            {"transition-all transform ease-in duration-200", "translate-x-0", "translate-x-full"},
          time: 200
        )
      }
      selected_item={@selected_item}
      cart={@cart}
    />

    <div class="w-full mt-[35px] xxl:mt-[60px] px-4 lg:px-[35px] pb-10">
      <div class="grid grid-cols-1 gap-x-3 gap-y-3 mt-9 md:grid-cols-2 md:gap-x-4 md:gap-y-4 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-4 xl:gap-y-4 xxl:grid-cols-4 large:grid-cols-5">
        <%= if length(@search_results) > 0 do %>
          <%= for item <- @search_results do %>
            <ItemCard.main item={item} cart={@cart} />
          <% end %>
        <% else %>
          <%= for item <- @items do %>
            <ItemCard.main item={item} cart={@cart} />
          <% end %>
        <% end %>
      </div>
    </div>
    """
  end
end
