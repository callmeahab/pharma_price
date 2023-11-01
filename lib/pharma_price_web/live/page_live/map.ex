defmodule PharmaPriceWeb.PharmaPriceWeb.PageLive.Map do
  use PharmaPriceWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div id="map" phx-hook="MainMap" class="pt-[0px] w-screen" style="height: calc(100vh - 250px)">
    </div>
    """
  end
end
