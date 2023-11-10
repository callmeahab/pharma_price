defmodule PharmaPriceWeb.ItemCard do
  use PharmaPriceWeb, :html

  def main(assigns) do
    {_, price} =
      PharmaPrice.Cldr.Number.to_string(assigns.item.price,
        locale: "de",
        currency: "RSD"
      )

    assigns =
      assigns
      |> assign(:item, %{assigns.item | price: price})

    ~H"""
    <div
      class="flex mx-auto flex-col w-full border-4 rounded-2xl bg-white p-6 border-slate-200 hover:drop-shadow-lg
      text-slate-700 transition ease-in-out duration-200 cursor-pointer"
      phx-click={JS.patch(~p"/item-details/#{@item.id}")}
    >
      <div class="flex mb-4 text-[#61AC27]">
        <div class="flex border-4 border-[#61AC27] font-semibold text-sm rounded-2xl py-0.5 px-2">
          -7%
        </div>
        <div class="flex-grow"></div>
        <div class="flex h-full my-auto justify-end">
          <Heroicons.Outline.heart class="h-8 m-auto transition ease-in-out duration-200 hover:fill-[#61AC27]" />
        </div>
      </div>
      <div class="flex align-middle justify-center w-full mx-auto pb-4">
        <img
          style="max-width:100%;display:block;margin:0;border:none;padding:0"
          class="h-72 mx-auto object-cover"
          alt={@item.name}
          aria-hidden="true"
          src={@item.thumbnail}
        />
      </div>
      <div class="font-bold w-full text-slate-700 mb-2 text-[16px]">
        <%= @item.name %>
      </div>
      <div class="flex items-center my-2 overflow-hidden w-full">
        <span class="text-slate-500 text-[11px] capitalize">Proizvodjač: </span><span class="text-slate-500 text-[12px] truncate">A-Derma</span>
      </div>

      <div class="font-bold w-full text-slate-700 mb-2 text-[20px] pb-4">
        <%= @item.price %>
      </div>

      <div class="flex pb-6">
        <img src={@vendor.logo} alt="" class="h-10" decoding="async" data-nimg="intrinsic" />
      </div>
      <div class="flex flex-grow"></div>
      <.link class="flex btn btn-primary py-3 px-4 text-white text-ellipsis justify-center text-center text-sm w-full rounded-3xl">
        Dodajte u korpu
      </.link>
    </div>
    """
  end
end
