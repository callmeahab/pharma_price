defmodule PharmaPriceWeb.PageLive.Index do
  use PharmaPriceWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket |> assign(:points, [1, 2, 3, 4, 5])}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="w-full flex items-center justify-center bg-gray-f7 p-[30px] h-480px md:h-[580px] 2xxl:h-[650px] relative">
      <img
        src="/images/hero-banner-img-e90e52e3ad0984e060be92156b9333c6.jpg"
        alt="hero-image"
        class="w-full h-full hidden md:flex absolute top-0 left-0 object-cover"
      />
      <div class="flex flex-col relative z-10 justify-center items-center w-full max-w-[720px]">
        <h1 class="font-normal text-[30px] text-gray-900 text-center mb-4">
          <span class="font-bold">PharmaPrice</span>
          Get The<span class="font-bold block">Best Price</span>
        </h1>
        <p class="text-[17px] text-gray-700 lg:mb-[60px] text-center leading-loose">
          Start searching for your medicine to find the best deals near you.
        </p>
        <form
          novalidate=""
          role="search"
          class="items-center justify-center w-full lg:max-w-screen-md rounded relative overflow-hidden hidden lg:flex"
        >
          <span class="absolute top-0 left-0 flex items-center justify-center h-full w-[50px]">
            <svg xmlns="http://www.w3.org/2000/svg" width="14px" height="14px" viewBox="0 0 14 14">
              <path
                d="M14.771,12.752,11.32,9.286a5.519,5.519,0,0,0,1.374-3.634A5.763,5.763,0,0,0,6.839,0,5.763,5.763,0,0,0,.984,5.652,5.763,5.763,0,0,0,6.839,11.3a5.936,5.936,0,0,0,3.354-1.023l3.477,3.492a.783.783,0,0,0,1.08.02A.72.72,0,0,0,14.771,12.752ZM6.839,1.475a4.259,4.259,0,0,1,4.327,4.178A4.259,4.259,0,0,1,6.839,9.83,4.259,4.259,0,0,1,2.511,5.652,4.259,4.259,0,0,1,6.839,1.475Z"
                transform="translate(-0.984)"
                fill="#5a5a5a"
              >
              </path>
            </svg>
          </span>
          <label for="search-normal" class="sr-only">search-normal</label>
          <input
            type="search"
            placeholder="Search your medicine here"
            class="w-full h-12 pl-12 px-4 text-gray-900 placeholder-gray-700 bg-white border-2 border-black rounded outline-none transition duration-200 focus:border-black focus:placeholder-gray-900"
            id="search-normal"
            value=""
            autocomplete="off"
          />
        </form>
        <span style="font-size:0"></span>
      </div>
    </div>

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
              <p class="w-full leading-6 text-14px">
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

    <div class="h-96">This is where the content goes.</div>
    """
  end
end
