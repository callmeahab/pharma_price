defmodule PharmaPriceWeb.MainMenu do
  use PharmaPriceWeb, :html

  def render(assigns) do
    ~H"""
    <div class="drawer drawer-menu">
      <div class="flex flex-col w-full h-full">
        <div class="w-full h-[90px] bg-gray-100 flex justify-start items-center relative px-[30px] flex-shrink-0">
          <a
            class="flex w-80 text-transparent tracking-tighter font-bold text-xl text-violet-800"
            href="/"
          >
            PHARMA PRICE
          </a>

          <button
            class="w-[30px] h-[30px] flex items-center justify-center text-gray-700 absolute right-[25px] focus:outline-none hover:text-violet-600 hover:scale-110 transition ease-in-out duration-200"
            aria-label="close"
            phx-click={hide_drawer(".drawer-menu")}
          >
            <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" viewBox="0 0 18 18">
              <path
                fill="currentColor"
                d="M6.572,4.87a1.2,1.2,0,0,0-1.7,1.7l6.947,6.947L4.87,20.465a1.2,1.2,0,1,0,1.7,1.7l6.946-6.946,6.946,6.946a1.2,1.2,0,0,0,1.7-1.7l-6.946-6.946,6.947-6.947a1.2,1.2,0,0,0-1.7-1.7l-6.946,6.947Z"
                transform="translate(-4.518 -4.518)"
              >
              </path>
            </svg>
          </button>
        </div>
        <div class="os-host os-host-foreign menu-scrollbar flex-grow os-theme-thin os-host-resize-disabled os-host-scrollbar-horizontal-hidden os-host-scrollbar-vertical-hidden os-host-transition">
          <div class="os-resize-observer-host observed">
            <div class="os-resize-observer" style="left: 0px; right: auto;"></div>
          </div>
          <div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;">
            <div class="os-resize-observer"></div>
          </div>
          <div class="os-content-glue" style="margin: 0px; width: 449px; height: 645px;"></div>
          <div class="os-padding">
            <div class="os-viewport os-viewport-native-scrollbars-invisible os-viewport-native-scrollbars-overlaid">
              <div class="os-content" style="padding: 0px; height: 100%; width: 100%;">
                <div class="flex flex-col py-[60px] pb-[40px] lg:pb-[60px]">
                  <a
                    class="menu-item relative text-gray-900 pl-[30px] pr-4 mb-8 transition duration-300 ease-in-out last:mb-0 hover:text-gray-900"
                    href="/map"
                  >
                    Map screen
                  </a>

                  <%= if @current_user do %>
                    <.link
                      href={~p"/users/settings"}
                      class="menu-item relative text-gray-900 pl-[30px] pr-4 mb-8 transition duration-300 ease-in-out last:mb-0 hover:text-gray-900"
                    >
                      User Settings
                    </.link>

                    <.link
                      href={~p"/users/log_out"}
                      method="delete"
                      class="menu-item relative text-gray-900 pl-[30px] pr-4 mb-8 transition duration-300 ease-in-out last:mb-0 hover:text-gray-900"
                    >
                      Log out
                    </.link>
                  <% else %>
                    <.link
                      href={~p"/users/register"}
                      class="menu-item relative text-gray-900 pl-[30px] pr-4 mb-8 transition duration-300 ease-in-out last:mb-0 hover:text-gray-900 active"
                    >
                      Register
                    </.link>
                    <.link
                      href={~p"/users/log_in"}
                      class="menu-item relative text-gray-900 pl-[30px] pr-4 mb-8 transition duration-300 ease-in-out last:mb-0 hover:text-gray-900"
                    >
                      Log in
                    </.link>
                  <% end %>
                </div>
              </div>
            </div>
          </div>
          <div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable">
            <div class="os-scrollbar-track os-scrollbar-track-off">
              <div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);">
              </div>
            </div>
          </div>
          <div class="os-scrollbar os-scrollbar-vertical os-scrollbar-unusable">
            <div class="os-scrollbar-track os-scrollbar-track-off">
              <div class="os-scrollbar-handle" style="height: 100%; transform: translate(0px, 0px);">
              </div>
            </div>
          </div>
          <div class="os-scrollbar-corner"></div>
        </div>
        <div class="flex items-center justify-start border-t border-gray-300 bg-gray-100 h-12 px-[30px] flex-shrink-0 lg:hidden">
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
      </div>
    </div>
    """
  end
end
