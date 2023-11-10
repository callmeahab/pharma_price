defmodule PharmaPriceWeb.UserLoginLive do
  use PharmaPriceWeb, :live_view

  def render(assigns) do
    ~H"""
    <.header class="text-center pt-10">
      <span class="text-[30px]">Sign in to account</span>
      <:subtitle>
        Nemate nalog?
        <.link navigate={~p"/users/register"} class="font-semibold text-[#61AC27] hover:underline">
          Registrujte se
        </.link>
        da bi napravili nalog.
      </:subtitle>
    </.header>
    <div class="flex flex-grow justify-center space-y-12 divide-y m-auto pb-10 h-full">
      <div class="w-96">
        <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
          <.input field={@form[:email]} type="email" label="Email" required />
          <.input field={@form[:password]} type="password" label="Password" required />

          <:actions>
            <.input field={@form[:remember_me]} type="checkbox" label="Keep me logged in" />
            <.link href={~p"/users/reset_password"} class="text-sm font-semibold hover:text-[#61AC27]">
              Forgot your password?
            </.link>
          </:actions>
          <:actions>
            <.button phx-disable-with="Signing in..." class="w-full">
              Sign in <span aria-hidden="true">→</span>
            </.button>
          </:actions>
        </.simple_form>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = live_flash(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
