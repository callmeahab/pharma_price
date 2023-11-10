defmodule PharmaPriceWeb.Header do
  use PharmaPriceWeb, :html

  def render(assigns) do
    ~H"""
    <div class="flex w-full bg-[#2C4341] h-[50px] px-32 items-center">
      <div class="text-[#61AC27] align-middle my-auto text-sm">Izaberite grad:</div>
      <div class="my-auto text-sm text-white flex mx-2 hover:text-[#61AC27] cursor-pointer transition ease-in-out duration-200">
        <span>Beograd</span>
        <span class="my-auto"><Heroicons.Outline.chevron_down class="pl-1 h-4" /></span>
      </div>
      <div class="text-[#61AC27] align-middle my-auto text-sm pl-4">
        <Heroicons.Outline.globe class="h-5" />
      </div>
      <div class="my-auto text-sm text-white flex mx-2 hover:text-[#61AC27] cursor-pointer transition ease-in-out duration-200 flex-grow">
        <span>RSD</span>
        <span class="my-auto"><Heroicons.Outline.chevron_down class="pl-1 h-4" /></span>
      </div>
      <div class="justify-end text-sm">
        <ul class="hidden h-full lg:flex items-center gap-4">
          <%= if @current_user do %>
            <li>
              <.link
                href={~p"/users/settings"}
                class="flex text-sm my-auto text-white hover:text-[#61AC27] transition ease-in-out duration-200"
              >
                <%= @current_user.email %>
                <Heroicons.Outline.user class="h-5 pl-1 my-auto" />
              </.link>
            </li>
          <% else %>
            <li>
              <.link
                href={~p"/users/register"}
                class="flex text-sm my-auto text-white hover:text-[#61AC27] transition ease-in-out duration-200"
              >
                Registracija <Heroicons.Outline.user class="h-5 pl-1 my-auto" />
              </.link>
            </li>
            <li>
              <.link
                href={~p"/users/log_in"}
                class="flex text-sm my-auto text-white hover:text-[#61AC27] transition ease-in-out duration-200"
              >
                Ulogujte se <Heroicons.Outline.user class="h-5 pl-1 my-auto" />
              </.link>
            </li>
          <% end %>
        </ul>
      </div>
    </div>

    <div class="flex flex-row w-full h-[120px] px-32 items-center align-middle gap-4 pb-2">
      <.link href="/" class="font-bold text-[26px] text-[#61AC27]">Apošteka</.link>

      <div>
        <div
          class="btn bg-white border-slate-200 border-4 py-1.5 px-4 rounded-3xl font-medium flex text-[#61AC27] cursor-pointer hover:text-white hover:bg-[#61AC27] transition ease-in-out duration-200 hover:border-transparent"
          phx-click={toggle_drawer("#category-menu", "flex")}
        >
          <Heroicons.Outline.menu_alt_1 class="h-5 my-auto mr-2" />
          <div class="my-auto font-medium">Kategorije</div>
        </div>
        <div
          id="category-menu"
          class="absolute hidden z-20 mt-3 px-10 py-6 bg-white drop-shadow-2xl text-slate-700 rounded-[20px] font-medium flex-row space-x-14"
        >
          <div class="flex flex-col">
            <div class="text-[#61AC27] font-semibold">Grupa 1</div>
            <.link>Kategorija 1</.link>
            <.link>Kategorija 2</.link>
            <.link>Kategorija 3</.link>
            <.link>Kategorija 4</.link>
            <.link>Kategorija 5</.link>
            <div class="text-[#61AC27] pt-4 font-semibold">Grupa 2</div>
            <.link>Kategorija 6</.link>
            <.link>Kategorija 7</.link>
            <.link>Kategorija 8</.link>
          </div>

          <div class="flex flex-col">
            <div class="text-[#61AC27] font-semibold">Grupa 3</div>
            <.link>Kategorija 1</.link>
            <.link>Kategorija 2</.link>
            <div class="text-[#61AC27] pt-4 font-semibold">Grupa 4</div>
            <.link>Kategorija 3</.link>
            <.link>Kategorija 4</.link>
            <.link>Kategorija 5</.link>
            <.link>Kategorija 6</.link>
            <.link>Kategorija 7</.link>
            <.link>Kategorija 8</.link>
          </div>

          <div class="flex flex-col">
            <div class="text-[#61AC27] font-semibold">Grupa 5</div>
            <.link>Kategorija 1</.link>
            <.link>Kategorija 2</.link>
            <.link>Kategorija 3</.link>
            <div class="text-[#61AC27] pt-4 font-semibold">Grupa 6</div>
            <.link>Kategorija 4</.link>
            <.link>Kategorija 5</.link>
          </div>
        </div>
      </div>

      <.form
        :let={f}
        phx-change="search"
        phx-submit="search"
        for={%{}}
        as={:search}
        novalidate=""
        role="search"
        class="flex flex-grow"
      >
        <.search_input
          type="search"
          name="search"
          field={f[:q]}
          value={@q}
          phx-change="search"
          id="search-normal"
        />
      </.form>

      <.link class="link link-primary link-hover flex-col justify-center align-middle text-[#61AC27] hover:text-slate-700 transition ease-in-out duration-200">
        <Heroicons.Outline.heart class="h-8 justify-center mx-auto" />
        <span class="text-sm">Sačuvano</span>
      </.link>

      <.link class="link link-primary link-hover flex-col justify-center align-middle text-[#61AC27] hover:text-slate-700 transition ease-in-out duration-200">
        <Heroicons.Outline.shopping_cart class="h-8 justify-center mx-auto" />
        <span class="text-sm">Korpa</span>
      </.link>

      <.link class="btn btn-primary py-3 px-4 text-white text-ellipsis text-center text-sm w-64 rounded-3xl">
        +381 (063) 12 330 112
      </.link>
    </div>

    <%!-- <header class="flex items-center text-gray-700 body-font bg-white w-full h-[90px] lg:shadow-header pr-[20px] md:pr-[30px] lg:pr-[40px]">
      <button
        aria-label="Menu"
        class="menuBtn flex flex-col items-center justify-center w-[50px] flex-shrink-0 h-full outline-none focus:outline-none lg:w-[90px] hover:scale-105 transition ease-in-out duration-200"
        phx-click={show_drawer(".drawer-menu", "flex")}
      >
        <span class="menuIcon">
          <span class="bar"></span>
          <span class="bar"></span>
          <span class="bar"></span>
        </span>
      </button>

      <a
        href="/"
        class="hidden lg:flex w-96 text-transparent tracking-tighter font-bold text-xl text-lg:2xl text-violet-800"
      >
        PHARMA PRICE
      </a>

      <div class="w-full items-center ml-[10px] mr-[20px] lg:mr-10 lg:ml-auto transition duration-350 ease-in-out flex lg:opacity-0 lg:invisible">
        <form
          novalidate=""
          role="search"
          class="flex items-center justify-center w-full lg:max-w-screen-md rounded relative overflow-hidden search-outline"
        >
          <span class="absolute top-0 left-0 flex items-center justify-center h-full w-[50px]">
            <svg xmlns="http://www.w3.org/2000/svg" width="14px" height="14px" viewBox="0 0 14 14">
              <path
                d="M14.771,12.752,11.32,9.286a5.519,5.519,0,0,0,1.374-3.634A5.763,5.763,0,0,0,6.839,0,5.763,5.763,0,0,0,.984,5.652,5.763,5.763,0,0,0,6.839,11.3a5.936,5.936,0,0,0,3.354-1.023l3.477,3.492a.783.783,0,0,0,1.08.02A.72.72,0,0,0,14.771,12.752ZM6.839,1.475a4.259,4.259,0,0,1,4.327,4.178A4.259,4.259,0,0,1,6.839,9.83,4.259,4.259,0,0,1,2.511,5.652,4.259,4.259,0,0,1,6.839,1.475Z"
                transform="translate(-0.984)"
                fill="#999999"
              >
              </path>
            </svg>
          </span>
          <label for="search-outline" class="sr-only">search-outline</label>
          <input
            type="search"
            placeholder="Search your medicine here"
            class="w-full h-12 pl-12 px-4 text-gray-900 placeholder-gray-500 bg-gray-f7 border-2 border-transparent rounded outline-none transition ease-in-out duration-200 hover:border-gray-400 focus:border-black focus:placeholder-gray-900"
            id="search-outline"
            value=""
            autocomplete="off"
          />
        </form>
      </div>

      <ul class="hidden relative z-10 lg:flex items-center gap-4 px-4 sm:px-6 lg:px-8 justify-end">
        <%= if @current_user do %>
          <li>
            <.link
              href={~p"/users/settings"}
              class="flex text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-violet-600 transition ease-in-out duration-200 hover:scale-105"
            >
              <%= @current_user.email %>
            </.link>
          </li>
        <% else %>
          <li>
            <.link
              href={~p"/users/register"}
              class="flex text-[0.8125rem] leading-6 text-zinc-900 font-semibold hover:text-violet-600 transition ease-in-out duration-200 hover:scale-105"
            >
              Register
            </.link>
          </li>
          <li>
            <.link
              href={~p"/users/log_in"}
              class="flex w-10 text-[0.8125rem] text-zinc-900 font-semibold hover:text-violet-600 transition ease-in-out duration-200 hover:scale-105"
            >
              Log in
            </.link>
          </li>
        <% end %>
      </ul>

      <button
        class="cart-button flex justify-center flex-shrink-0 h-auto relative focus:outline-none hover:text-violet-600 hover:scale-105 transition ease-in-out duration-200"
        aria-label="cart-button"
        phx-click={show_cart_drawer(".drawer-cart")}
      >
        <svg xmlns="http://www.w3.org/2000/svg" width="20px" height="22px" viewBox="0 0 18 18">
          <path
            d="M4.7,3.8H17.3a.9.9,0,0,1,.9.9V17.3a.9.9,0,0,1-.9.9H4.7a.9.9,0,0,1-.9-.9V4.7A.9.9,0,0,1,4.7,3.8ZM2,4.7A2.7,2.7,0,0,1,4.7,2H17.3A2.7,2.7,0,0,1,20,4.7V17.3A2.7,2.7,0,0,1,17.3,20H4.7A2.7,2.7,0,0,1,2,17.3ZM11,11C8.515,11,6.5,8.582,6.5,5.6H8.3c0,2.309,1.5,3.6,2.7,3.6s2.7-1.291,2.7-3.6h1.8C15.5,8.582,13.485,11,11,11Z"
            transform="translate(-2 -2)"
            fill="currentColor"
            fill-rule="evenodd"
          >
          </path>
        </svg>
        <span
          class="items-center justify-center w-[18px] h-[18px] flex bg-gray-900 text-white absolute rounded-full"
          style="font-size: 10px; top: -10px; right: -10px"
        >
          0
        </span>
      </button>
    </header> --%>
    """
  end
end
