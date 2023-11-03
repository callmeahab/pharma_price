defmodule PharmaPriceWeb.Header do
  use PharmaPriceWeb, :html

  def render(assigns) do
    ~H"""
    <header class="flex items-center shadow-lg text-gray-700 body-font fixed bg-white w-full h-[90px] z-20 lg:shadow-header pr-[20px] md:pr-[30px] lg:pr-[40px]">
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
    </header>
    """
  end
end
