defmodule PharmaPriceWeb.SearchInput do
  use PharmaPriceWeb, :html

  def main(assigns) do
    ~H"""
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
    """
  end
end
