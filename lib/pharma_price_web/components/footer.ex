defmodule PharmaPriceWeb.Footer do
  use PharmaPriceWeb, :html

  def render(assigns) do
    ~H"""
    <footer class="w-full flex fixed bottom-0 items-center justify-center bg-[#2C4341] shadow-footer px-4 py-[30px] lg:px-[35px] lg:justify-between">
      <p class="text-white text-sm justify-end">
        Copyright © <!-- -->2023<!-- -->
        <a
          class="font-semibold transition-colors duration-200 ease-in-out hover:text-[#61AC27]"
          href="/"
        >
          Milos Markovic
        </a>
        <!-- -->All rights reserved
      </p>
    </footer>
    """
  end
end
