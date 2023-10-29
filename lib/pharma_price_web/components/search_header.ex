defmodule PharmaPriceWeb.SearchHeader do
  alias PharmaPriceWeb.SearchInput
  use PharmaPriceWeb, :html

  def render(assigns) do
    ~H"""
    <div class="w-full flex items-center justify-center bg-gray-f7 p-[30px] h-[480px] md:h-[580px] 2xxl:h-[650px] relative">
      <img
        src="/images/pexels-nataliya-vaitkevich-7526020.jpg"
        alt="hero-image"
        class="w-full h-full hidden md:flex absolute top-0 left-0 object-cover"
      />
      <div class="flex flex-col relative z-10 justify-center items-center w-full max-w-[720px]">
        <h1 class="font-normal text-[30px] text-gray-900 drop-shadow-[0_35px_35px_rgba(255,255,255,1)] text-center mb-4">
          <span class="font-bold">PharmaPrice</span>
          Get The<span class="font-bold block">Best Price</span>
        </h1>
        <p class="text-[17px] text-gray-700 drop-shadow-[0_35px_35px_rgba(255,255,255,1)] lg:mb-[60px] text-center leading-loose">
          Start searching for your medicine to find the best deals near you.
        </p>
        <SearchInput.main q={@q} />
        <span style="font-size:0"></span>
      </div>
    </div>
    """
  end
end
