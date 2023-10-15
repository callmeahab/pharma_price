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
     |> stream(:items, Products.list_products())
     |> assign(:selected_item, selected_item)
     |> assign(:cart, cart)}
  end

  @impl true
  def handle_event("inc_count", %{"id" => id}, socket) do
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
    <SearchHeader.render />
    <HeroInfo.render />
    <ItemDetails.render
      :if={@selected_item}
      phx-mounted={
        JS.show(
          to: ".drawer-item-details",
          display: "flex",
          transition: {"ease-in duration-200", "translate-x-full", "translate-x-full - 450px"},
          time: 200
        )
      }
      phx-remove={
        JS.hide(
          to: ".drawer-item-details",
          transition: {"ease-in duration-200", "translate-x-0", "translate-x-full"},
          time: 200
        )
      }
      selected_item={@selected_item}
      cart={@cart}
    />

    <div class="w-full mt-[35px] xxl:mt-[60px] px-4 lg:px-[35px] pb-10">
      <div class="grid grid-cols-1 gap-x-3 gap-y-3 mt-9 md:grid-cols-2 md:gap-x-4 md:gap-y-4 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-4 xl:gap-y-4 xxl:grid-cols-4 large:grid-cols-5">
        <%= for {_id, item} <- @streams.items do %>
          <ItemCard.main item={item} cart={@cart} />
        <% end %>
      </div>
    </div>
    """
  end
end
