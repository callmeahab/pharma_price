defmodule PharmaPriceWeb.PharmaPriceWeb.PageLive.Map do
  use PharmaPriceWeb, :live_view
  alias PharmaPrice.Accounts
  alias PharmaPriceWeb.Header

  @impl true
  def mount(_params, %{"user_token" => user_token} = _session, socket) do
    {:ok,
     socket
     |> assign(
       :current_user,
       if user_token do
         Accounts.get_user_by_session_token(user_token)
       else
         nil
       end
     )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <Header.render current_user={@current_user} q={nil} />

    <div id="map" phx-hook="MainMap" class="pt-[0px] w-screen" style="height: calc(100vh - 250px)">
    </div>
    """
  end
end
