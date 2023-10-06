defmodule PharmaPriceWeb.Footer do
  use PharmaPriceWeb, :html

  def render(assigns) do
    ~H"""
    <footer class="w-full m-auto flex items-center justify-center bg-white shadow-footer px-4 py-[30px] lg:px-[35px] lg:justify-between">
      <p class="text-gray-900 text-sm">
        Copyright © <!-- -->2023<!-- -->
        <a
          class="font-semibold transition-colors duration-200 ease-in-out hover:text-pink-600"
          href="/"
        >
          Milos Markovic
        </a>
        <!-- -->All rights reserved
      </p>
      <div class="items-center hidden lg:flex">
        <a href="/" class="social facebook" target="_blank">
          <span class="sr-only">facebook</span><svg
            xmlns="http://www.w3.org/2000/svg"
            width="15px"
            height="15px"
            viewBox="0 0 15 15"
          ><path
            data-name="Path 1079"
            d="M77.227,64H64.773a.773.773,0,0,0-.773.773V77.227a.773.773,0,0,0,.773.773H71V72.458H69.327V70.417H71V68.907a2.66,2.66,0,0,1,2.869-2.793c.773,0,1.6.058,1.8.084v1.889H74.38c-.879,0-1.046.416-1.046,1.028v1.3h2.093l-.273,2.042H73.333V78h3.894A.773.773,0,0,0,78,77.227V64.773A.773.773,0,0,0,77.227,64Z"
            transform="translate(-63.5 -63.5)"
            fill="currentColor"
            stroke="rgba(0,0,0,0)"
            stroke-miterlimit="10"
            stroke-width="1"
          ></path></svg>
        </a>
        <a href="/" class="social twitter" target="_blank">
          <span class="sr-only">twitter</span><svg
            xmlns="http://www.w3.org/2000/svg"
            width="21px"
            height="16px"
            viewBox="0 0 20.64 15.339"
          ><path
            data-name="Path 1080"
            d="M37.3,65.659a7.136,7.136,0,0,1-2.027.558,3.542,3.542,0,0,0,1.553-1.954,7.014,7.014,0,0,1-2.242.857,3.529,3.529,0,0,0-6.107,2.414,3.456,3.456,0,0,0,.091.806A10,10,0,0,1,21.3,64.645a3.537,3.537,0,0,0,1.1,4.718,3.448,3.448,0,0,1-1.6-.441v.044a3.533,3.533,0,0,0,2.833,3.464,3.553,3.553,0,0,1-.93.124,3.33,3.33,0,0,1-.664-.066,3.535,3.535,0,0,0,3.3,2.454,7.077,7.077,0,0,1-4.386,1.513A7.153,7.153,0,0,1,20.1,76.4,9.866,9.866,0,0,0,25.5,78,9.983,9.983,0,0,0,35.555,67.945c0-.153,0-.306-.011-.456A7.185,7.185,0,0,0,37.3,65.659Z"
            transform="translate(-18.034 -63.161)"
            fill="currentColor"
            stroke="rgba(0,0,0,0)"
            stroke-miterlimit="10"
            stroke-width="1"
          ></path></svg>
        </a>
        <a href="/" class="social instagram" target="_blank">
          <span class="sr-only">instagram</span><svg
            xmlns="http://www.w3.org/2000/svg"
            width="14px"
            height="14px"
            viewBox="0 0 14 14"
          ><path
            data-name="Path 1083"
            d="M41.917,33.167a2.926,2.926,0,0,1,2.917,2.917v5.833a2.926,2.926,0,0,1-2.917,2.917H36.083a2.926,2.926,0,0,1-2.917-2.917V36.083a2.926,2.926,0,0,1,2.917-2.917h5.833m0-1.167H36.083A4.1,4.1,0,0,0,32,36.083v5.833A4.1,4.1,0,0,0,36.083,46h5.833A4.1,4.1,0,0,0,46,41.917V36.083A4.1,4.1,0,0,0,41.917,32Z"
            transform="translate(-32 -32)"
            fill="currentColor"
          ></path><path
            data-name="Path 1084"
            d="M350.2,108.42a.873.873,0,1,1,.619-.256A.875.875,0,0,1,350.2,108.42Z"
            transform="translate(-339.413 -104.337)"
            fill="currentColor"
          ></path><path
            data-name="Path 1085"
            d="M147.5,145.167a2.333,2.333,0,1,1-2.333,2.333,2.333,2.333,0,0,1,2.333-2.333m0-1.167a3.5,3.5,0,1,0,3.5,3.5A3.5,3.5,0,0,0,147.5,144Z"
            transform="translate(-140.5 -140.5)"
            fill="currentColor"
          ></path></svg>
        </a>
      </div>
    </footer>
    """
  end
end
