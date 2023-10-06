defmodule PharmaPriceWeb.HeroInfo do
  use PharmaPriceWeb, :html

  def render(assigns) do
    ~H"""
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
    """
  end
end
