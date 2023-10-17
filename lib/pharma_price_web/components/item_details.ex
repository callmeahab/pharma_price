defmodule PharmaPriceWeb.ItemDetails do
  use PharmaPriceWeb, :html

  def render(assigns) do
    {_, price} =
      PharmaPrice.Cldr.Number.to_string(assigns.selected_item.price,
        locale: "de",
        currency: "RSD"
      )

    assigns = assign(assigns, :selected_item, %{assigns.selected_item | price: price})

    ~H"""
    <div id="drawer-item-details" class="drawer drawer-item-details drawer-right">
      <div class="flex flex-col w-full h-full">
        <div class="w-full flex justify-center relative px-[30px] py-[20px]">
          <button
            class="w-auto h-10 flex items-center justify-center text-gray-400 absolute top-half -mt-[4px] left-[30px] transition duration-300 focus:outline-none hover:text-pink-600 hover:scale-125"
            aria-label="close"
            phx-click="deselect_item"
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="19px" height="12px" viewBox="0 0 18.738 12">
              <path
                data-name="Path 17147"
                d="M1252.468,501.849l5.7-5.922,1.5,1.567-3.395,3.143.091.214h14.849v2.108H1256.2l3.654,3.43-1.558,1.538Z"
                transform="translate(-1252.468 -495.927)"
                fill="currentColor"
              >
              </path>
            </svg>
          </button>
          <h2 class="font-bold text-[20px] m-0">Detalji</h2>
        </div>
        <div class="os-host os-host-foreign details-scrollbar flex-grow os-theme-thin os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-transition">
          <div class="os-resize-observer-host observed">
            <div class="os-resize-observer" style="left: 0px; right: auto;"></div>
          </div>
          <div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;">
            <div class="os-resize-observer"></div>
          </div>
          <div class="os-content-glue" style="margin: 0px; width: 449px; height: 600px;"></div>
          <div class="os-padding">
            <div
              class="os-viewport os-viewport-native-scrollbars-invisible os-viewport-native-scrollbars-overlaid"
              style="overflow-y: scroll;"
            >
              <div class="os-content" style="padding: 0px; height: 100%; width: 100%;">
                <div class="flex flex-col p-[30px] pt-0">
                  <div class="flex items-center justify-center w-full h-[360px] overflow-hidden rounded mb-[30px]">
                    <img src={@selected_item.thumbnail} alt={@selected_item.name} />
                  </div>
                  <div class="flex flex-col items-start mb-4">
                    <span class="text-gray-900 font-semibold mb-2">
                      <%= @select_item.price %>
                    </span>
                    <span class="mb-3"><%= @selected_item.name %></span>
                    <p class="flex items-center mb-5">
                      <span class=" text-gray-500 text-[11px] capitalize">Tablete</span><span class="flex bg-gray-500 w-[3px] h-[3px] rounded mx-3"></span><span class=" text-gray-500 text-[11px]">90 pieces</span>
                    </p>
                    <button
                      class="font-semibold text-[11px] text-gray-800 mt-2 focus:outline-none"
                      aria-label="details"
                    >
                      Vise detalja
                    </button>
                  </div>
                  <div class="flex w-full flex-col">
                    <div class="flex flex-col justify-start full mt-10 pr-[30px] even:pr-0">
                      <span class="text-gray-500 text-[11px] mb-2">Tip doziranja</span><span class="font-normal text-[13px] text-gray-900 capitalize">Tablet</span>
                    </div>
                    <div class="flex flex-col justify-start full mt-10 pr-[30px] even:pr-0">
                      <span class="text-gray-500 text-[11px] mb-2">Doza</span><span class="font-normal text-[13px] text-gray-900 capitalize">as per doctor advice</span>
                    </div>
                    <div class="flex flex-col justify-start full mt-10 pr-[30px] even:pr-0">
                      <span class="text-gray-500 text-[11px] mb-2">Aktivna supstanca</span><span class="font-normal text-[13px] text-gray-900 capitalize">Anti-caking agent (Sorbitol), Gum Acacia, Resistant Maltodextrin,</span>
                    </div>
                    <div class="flex flex-col justify-start full mt-10 pr-[30px] even:pr-0">
                      <span class="text-gray-500 text-[11px] mb-2">Proizvodjac</span><span class="font-normal text-[13px] text-gray-900 capitalize">Trividia</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable">
            <div class="os-scrollbar-track os-scrollbar-track-off">
              <div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);">
              </div>
            </div>
          </div>
          <div class="os-scrollbar os-scrollbar-vertical">
            <div class="os-scrollbar-track os-scrollbar-track-off">
              <div
                class="os-scrollbar-handle"
                style="height: 64.832793%; transform: translate(0px, 0px);"
              >
              </div>
            </div>
          </div>
          <div class="os-scrollbar-corner"></div>
        </div>
        <div class="flex flex-col p-[30px]">
          <%= if @cart[@selected_item.id] && @cart[@selected_item.id]["count"] > 0 do %>
            <div
              class="group flex items-center justify-between flex-shrink-0 rounded overflow-hidden bg-gray-900 shadow-floatingUp h-12 ml-auto w-full big"
              phx-mounted={
                JS.show(
                  transition: {"ease-in duration-200", "opacity-0", "opacity-100"},
                  time: 200
                )
              }
            >
              <button
                class="flex items-center justify-center outline-none duration-250 ease-in-out h-full w-[60px] text-white bg-gray-900 transition duration-300 hover:bg-gray-700 focus:outline-none"
                aria-label="button"
                phx-click="dec_count"
                phx-value-id={@selected_item.id}
              >
                <Heroicons.Outline.minus class="h-5 w-5" />
              </button>
              <span class="font-semibold text-[13px] text-white flex items-center justify-center h-full w-[40px] transition-colors duration-250 ease-in-out cursor-default">
                <%= @cart[@selected_item.id]["count"] %>
              </span>
              <button
                class="flex items-center justify-center outline-none duration-250 ease-in-out h-full w-[60px] text-white bg-gray-900 transition duration-300 hover:bg-gray-700 focus:outline-none"
                aria-label="button"
                phx-click="inc_count"
                phx-value-id={@selected_item.id}
              >
                <Heroicons.Outline.plus class="h-5 w-5" />
              </button>
            </div>
          <% else %>
            <button
              class="flex items-center justify-center flex-shrink-0 font-normal text-sm uppercase rounded outline-none transition duration-250 ease-in-out focus:outline-none text-white bg-gray-900 hover:bg-gray-700 h-12 px-[30px] w-full big"
              type="button"
              aria-label="button"
              phx-click="inc_count"
              phx-value-id={@selected_item.id}
              phx-mounted={
                JS.show(
                  transition: {"ease-in duration-200", "opacity-0", "opacity-100"},
                  time: 200
                )
              }
            >
              Add To Cart
            </button>
          <% end %>
        </div>
      </div>
    </div>
    """
  end
end
