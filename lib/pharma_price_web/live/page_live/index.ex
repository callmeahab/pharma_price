defmodule PharmaPriceWeb.PageLive.Index do
  alias PharmaPriceWeb.{SearchHeader, ItemCard, ItemDetails, HeroInfo}
  use PharmaPriceWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    selected_item = nil
    cart = %{}

    items = [
      %{
        "id" => "1",
        "count" => 0
      },
      %{
        "id" => "2",
        "count" => 0
      },
      %{
        "id" => "3",
        "count" => 0
      },
      %{
        "id" => "4",
        "count" => 0
      },
      %{
        "id" => "5",
        "count" => 0
      },
      %{
        "id" => "6",
        "count" => 0
      },
      %{
        "id" => "7",
        "count" => 0
      },
      %{
        "id" => "8",
        "count" => 0
      }
    ]

    {:ok,
     socket
     |> assign(:items, items)
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
    item = socket.assigns.items |> Enum.find(fn item -> item["id"] == id end)
    {:noreply, socket |> assign(:selected_item, item)}
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
    <ItemDetails.render selected_item={@selected_item} cart={@cart} />

    <div class="w-full mt-[35px] xxl:mt-[60px] px-4 lg:px-[35px] pb-10">
      <div class="grid grid-cols-1 gap-x-3 gap-y-3 mt-9 md:grid-cols-2 md:gap-x-4 md:gap-y-4 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-4 xl:gap-y-4 xxl:grid-cols-4 large:grid-cols-5">
        <%= for item <- @items do %>
          <ItemCard.main item={item} cart={@cart} />
        <% end %>
      </div>
    </div>
    """
  end
end
