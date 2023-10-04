defmodule PharmaPriceWeb.PageLive.Index do
  alias PharmaPriceWeb.SearchHeader
  alias PharmaPriceWeb.ItemCard
  use PharmaPriceWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
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

    {:ok, socket |> assign(:items, items)}
  end

  @impl true
  def handle_event("inc_count", %{"id" => id}, socket) do
    items =
      socket.assigns.items
      |> Enum.map(fn item ->
        if item["id"] == id do
          count = item |> Map.get("count")
          %{item | "count" => count + 1}
        else
          item
        end
      end)

    {:noreply, assign(socket, :items, items)}
  end

  @impl true
  def handle_event("dec_count", %{"id" => id}, socket) do
    items =
      socket.assigns.items
      |> Enum.map(fn item ->
        if item["id"] == id do
          count = item |> Map.get("count")

          if count > 0 do
            %{item | "count" => count - 1}
          else
            item
          end
        else
          item
        end
      end)

    {:noreply, assign(socket, :items, items)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <SearchHeader.main />

    <div class="flex w-full px-[15px] lg:px-[35px] mt-[35px] xxl:mt-[60px]">
      <div class="flex w-full px-[20px] md:p-[30px] py-[40px] rounded border border-gray-300 bg-white">
        <div class="feature-block-wrapper w-full grid grid-cols-1 gap-x-[30px] gap-y-[40px] md:grid-cols-2 xl:grid-cols-4 xxl:gap-[30px]">
          <div class="feature-block flex w-full items-start flex-row feature-block">
            <span
              class="flex items-center justify-center w-[70px] h-[70px] rounded-full mr-[20px] bg-gray-300 flex-shrink-0 text-[24px] font-semibold"
              style="background-color:#feeec8"
            >
              1
            </span>
            <div class="flex flex-col items-start">
              <span class="w-full text-[18px] font-semibold text-gray-900 mt-0 mb-2">Your Order</span>
              <p class="w-full leading-6 text-[14px]">
                Add products to your cart, enter your details and confirm.
              </p>
            </div>
          </div>
          <div class="feature-block flex w-full items-start flex-row feature-block">
            <span
              class="flex items-center justify-center w-[70px] h-[70px] rounded-full mr-[20px] bg-gray-300 flex-shrink-0 text-[24px] font-semibold"
              style="background-color:#ceeffe"
            >
              2
            </span>
            <div class="flex flex-col items-start">
              <span class="w-full text-[18px] font-semibold text-gray-900 mt-0 mb-2">
                Picking your order
              </span>
              <p class="w-full leading-6 text-[14px]">
                Your order is being picked and now will be forwarded for packaging.
              </p>
            </div>
          </div>
          <div class="feature-block flex w-full items-start flex-row feature-block">
            <span
              class="flex items-center justify-center w-[70px] h-[70px] rounded-full mr-[20px] bg-gray-300 flex-shrink-0 text-[24px] font-semibold"
              style="background-color:#d4f8c4"
            >
              3
            </span>
            <div class="flex flex-col items-start">
              <span class="w-full text-[18px] font-semibold text-gray-900 mt-0 mb-2">
                Packing Your Order
              </span>
              <p class="w-full leading-6 text-[14px]">
                We are packing your order and will be out for delivery soon.
              </p>
            </div>
          </div>
          <div class="feature-block flex w-full items-start flex-row feature-block">
            <span
              class="flex items-center justify-center w-[70px] h-[70px] rounded-full mr-[20px] bg-gray-300 flex-shrink-0 text-[24px] font-semibold"
              style="background-color:#d8dafe"
            >
              4
            </span>
            <div class="flex flex-col items-start">
              <span class="w-full text-[18px] font-semibold text-gray-900 mt-0 mb-2">Deliver</span>
              <p class="w-full leading-6 text-[14px]">
                Your order has been prepared and out for delivery. It will be delivered soon.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="w-full mt-[35px] xxl:mt-[60px] px-4 lg:px-[35px] pb-10">
      <div class="grid grid-cols-1 gap-x-3 gap-y-3 mt-9 md:grid-cols-2 md:gap-x-4 md:gap-y-4 lg:grid-cols-3 xl:grid-cols-4 xl:gap-x-4 xl:gap-y-4 xxl:grid-cols-4 large:grid-cols-5">
        <%= for item <- @items do %>
          <ItemCard.main item={item} />
        <% end %>
      </div>
    </div>
    """
  end
end
