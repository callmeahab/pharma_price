defmodule PharmaPriceWeb.VendorLive.Index do
  use PharmaPriceWeb, :live_view

  alias PharmaPrice.Vendors
  alias PharmaPrice.Vendors.Vendor

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :vendors, Vendors.list_vendors())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Vendor")
    |> assign(:vendor, Vendors.get_vendor!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Vendor")
    |> assign(:vendor, %Vendor{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Vendors")
    |> assign(:vendor, nil)
  end

  @impl true
  def handle_info({PharmaPriceWeb.VendorLive.FormComponent, {:saved, vendor}}, socket) do
    {:noreply, stream_insert(socket, :vendors, vendor)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    vendor = Vendors.get_vendor!(id)
    {:ok, _} = Vendors.delete_vendor(vendor)

    {:noreply, stream_delete(socket, :vendors, vendor)}
  end
end
