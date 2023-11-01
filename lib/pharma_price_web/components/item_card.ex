defmodule PharmaPriceWeb.ItemCard do
  use PharmaPriceWeb, :html

  def main(assigns) do
    {_, price} =
      PharmaPrice.Cldr.Number.to_string(assigns.item.price,
        locale: "de",
        currency: "RSD"
      )

    assigns = assign(assigns, :item, %{assigns.item | price: price})

    ~H"""
    <div class="w-full flex flex-col border border-gray-300 rounded p-4 bg-white transition duration-350 ease-in-out shadow-cart">
      <div class="flex flex-row items-start">
        <div class="flex justify-center items-center w-5/12 xxl:w-4/12 h-auto rounded overflow-hidden flex-shrink-0 mr-4">
          <div style="display:inline-block;max-width:100%;overflow:hidden;position:relative;box-sizing:border-box;margin:0">
            <div style="box-sizing:border-box;display:block;max-width:100%">
              <img
                style="max-width:100%;display:block;margin:0;border:none;padding:0"
                alt={@item.name}
                aria-hidden="true"
                src={@item.thumbnail}
              />
            </div>
            <img
              alt={@item.name}
              src={@item.thumbnail}
              srcset={@item.thumbnail}
              decoding="async"
              data-nimg="intrinsic"
              class="object-cover"
              style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%"
            />
            <noscript>
              <img
                alt={@item.name}
                src={@item.thumbnail}
                srcset="/images/fibre_sy4q5v.webp"
                decoding="async"
                data-nimg="intrinsic"
                style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%"
                class="object-cover"
                loading="lazy"
              />
            </noscript>
          </div>
        </div>
        <div class="flex flex-col w-full items-start overflow-hidden">
          <span class="font-semibold text-gray-900 mb-1 text-[16px]">
            <%= @item.price %>
          </span>
          <span class="text-[13px] text-gray-700 truncate w-full"><%= @item.name %></span>
          <div class="flex items-center my-1 overflow-hidden w-full">
            <span class="text-gray-500 text-[11px] capitalize">Tablet</span><span class="flex bg-gray-500 w-[3px] h-[3px] rounded mx-3 flex-shrink-0"></span><span class="text-gray-500 text-[11px] truncate">90<!-- --> Pieces</span>
          </div>
          <.link
            class="text-[11px] font-semibold text-gray-900 mt-1 focus:outline-none"
            patch={~p"/item-details/#{@item.id}"}
          >
            Detaljniji opis
          </.link>
          <div class="ml-auto mt-2 w-full flex justify-end items-end">
            <div class="relative h-[35px] flex-shrink-0 rounded overflow-hidden ">
              <div style="width: 110px; height: 100%;">
                <div class="group flex items-center justify-between h-[35px] rounded absolute top-0 right-0 bg-gray-900">
                  <%= if @cart[@item.id] && @cart[@item.id]["count"] > 0 do %>
                    <button
                      class="flex items-center justify-center outline-none duration-250 ease-in-out h-full w-[35px] text-white bg-gray-900 transition duration-300 hover:bg-gray-700 focus:outline-none"
                      aria-label="button"
                      phx-click="dec_count"
                      phx-value-id={@item.id}
                      phx-mounted={
                        JS.show(
                          transition: {"ease-in duration-500", "opacity-0", "opacity-100"},
                          time: 500
                        )
                      }
                    >
                      <Heroicons.Outline.minus class="h-5 w-5" />
                    </button>
                    <span
                      class="font-semibold text-[13px] text-white flex items-center justify-center h-full w-[40px] transition-colors duration-250 ease-in-out cursor-default"
                      phx-mounted={
                        JS.show(
                          transition: {"ease-in duration-500", "opacity-0", "opacity-100"},
                          time: 500
                        )
                      }
                    >
                      <%= @cart[@item.id]["count"] %>
                    </span>
                    <button
                      class="flex items-center justify-center outline-none duration-250 ease-in-out h-full w-[35px] text-white bg-gray-900 transition duration-300 hover:bg-gray-700 focus:outline-none"
                      aria-label="button"
                      phx-click="inc_count"
                      phx-value-id={@item.id}
                      phx-mounted={
                        JS.show(
                          transition: {"ease-in duration-300", "opacity-0", "opacity-100"},
                          time: 500
                        )
                      }
                    >
                      <Heroicons.Outline.plus class="h-5 w-5" />
                    </button>
                  <% else %>
                    <button
                      class="flex rounded items-center justify-center outline-none duration-250 ease-in-out h-full w-[35px] text-white bg-gray-900 transition duration-500 hover:bg-gray-700 focus:outline-none"
                      aria-label="button"
                      phx-click="inc_count"
                      phx-value-id={@item.id}
                      phx-mounted={
                        JS.show(
                          transition: {"ease-in duration-500", "opacity-0", "opacity-100"},
                          time: 500
                        )
                      }
                    >
                      <Heroicons.Outline.plus class="h-5 w-5" />
                    </button>
                  <% end %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    """
  end
end
