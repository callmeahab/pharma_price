defmodule PharmaPriceWeb.ItemCard do
  use PharmaPriceWeb, :html

  def main(assigns) do
    ~H"""
    <div class="w-full flex flex-col border border-gray-300 rounded p-4 bg-white transition duration-350 ease-in-out shadow-cart">
      <div class="flex flex-row items-start">
        <div class="flex justify-center items-center w-5/12 xxl:w-4/12 h-auto rounded overflow-hidden flex-shrink-0 mr-4">
          <div style="display:inline-block;max-width:100%;overflow:hidden;position:relative;box-sizing:border-box;margin:0">
            <div style="box-sizing:border-box;display:block;max-width:100%">
              <img
                style="max-width:100%;display:block;margin:0;border:none;padding:0"
                alt=""
                aria-hidden="true"
                src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTM4IiBoZWlnaHQ9IjEzOCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4="
              />
            </div>
            <img
              alt=" Alt Trueplus Fibre Food Supplement 90 Tablets"
              src="/images/fibre_sy4q5v.webp"
              srcset="/images/fibre_sy4q5v.webp"
              decoding="async"
              data-nimg="intrinsic"
              class="object-cover"
              style="position:absolute;top:0;left:0;bottom:0;right:0;box-sizing:border-box;padding:0;border:none;margin:auto;display:block;width:0;height:0;min-width:100%;max-width:100%;min-height:100%;max-height:100%"
            />
            <noscript>
              <img
                alt=" Alt Trueplus Fibre Food Supplement 90 Tablets"
                src="/images/fibre_sy4q5v.webp"
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
            $<!-- -->2.5
          </span><span class="text-[13px] text-gray-700 truncate w-full">Trueplus Fibre Food Supplement 90 Tablets</span>
          <div class="flex items-center my-1 overflow-hidden w-full">
            <span class="text-gray-500 text-[11px] capitalize">Tablet</span><span class="flex bg-gray-500 w-[3px] h-[3px] rounded mx-3 flex-shrink-0"></span><span class="text-gray-500 text-[11px] truncate">90<!-- --> Pieces</span>
          </div>
          <button class="text-[11px] font-semibold text-gray-900 mt-1 focus:outline-none">
            Details
          </button>
          <div class="ml-auto mt-2 w-full flex justify-end items-end">
            <div class="relative h-[35px] flex-shrink-0 rounded overflow-hidden ">
              <div style="width: 110px; height: 100%;">
                <div class="group flex items-center justify-between h-[35px] rounded absolute top-0 right-0 bg-gray-900">
                  <%= if @item["count"] > 0 do %>
                    <.count_exists item={@item} />
                  <% else %>
                    <.count_not_exists item={@item} />
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

  def count_not_exists(assigns) do
    ~H"""
    <button
      id={"count-not-exists-#{@item["id"]}"}
      class="flex rounded items-center justify-center outline-none duration-250 ease-in-out h-full w-[35px] text-white bg-gray-900 transition duration-300 hover:bg-gray-700 focus:outline-none"
      aria-label="button"
      phx-click="inc_count"
      phx-value-id={@item["id"]}
    >
      <Heroicons.Outline.plus class="h-5 w-5" />
    </button>
    """
  end

  def count_exists(assigns) do
    ~H"""
    <button
      class="flex items-center justify-center outline-none duration-250 ease-in-out h-full w-[35px] text-white bg-gray-900 transition duration-300 hover:bg-gray-700 focus:outline-none"
      aria-label="button"
      phx-click="dec_count"
      phx-value-id={@item["id"]}
    >
      <Heroicons.Outline.minus class="h-5 w-5" />
    </button>
    <span class="font-semibold text-[13px] text-white flex items-center justify-center h-full w-[40px] transition-colors duration-250 ease-in-out cursor-default">
      <%= Map.get(@item, "count") %>
    </span>
    <button
      class="flex items-center justify-center outline-none duration-250 ease-in-out h-full w-[35px] text-white bg-gray-900 transition duration-300 hover:bg-gray-700 focus:outline-none"
      aria-label="button"
      phx-click="inc_count"
      phx-value-id={@item["id"]}
    >
      <Heroicons.Outline.plus class="h-5 w-5" />
    </button>
    """
  end
end