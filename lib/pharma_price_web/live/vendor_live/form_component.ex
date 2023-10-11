defmodule PharmaPriceWeb.VendorLive.FormComponent do
  use PharmaPriceWeb, :live_component

  alias PharmaPrice.Vendors

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage vendor records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="vendor-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:name]} type="text" label="Name" />
        <.input field={@form[:logo]} type="text" label="Logo" />
        <.input field={@form[:logo_type]} type="text" label="Logo type" />
        <.input field={@form[:description]} type="text" label="Description" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Vendor</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{vendor: vendor} = assigns, socket) do
    changeset = Vendors.change_vendor(vendor)

    {:ok,
     socket
     |> assign(assigns)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"vendor" => vendor_params}, socket) do
    changeset =
      socket.assigns.vendor
      |> Vendors.change_vendor(vendor_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  def handle_event("save", %{"vendor" => vendor_params}, socket) do
    save_vendor(socket, socket.assigns.action, vendor_params)
  end

  defp save_vendor(socket, :edit, vendor_params) do
    case Vendors.update_vendor(socket.assigns.vendor, vendor_params) do
      {:ok, vendor} ->
        notify_parent({:saved, vendor})

        {:noreply,
         socket
         |> put_flash(:info, "Vendor updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp save_vendor(socket, :new, vendor_params) do
    case Vendors.create_vendor(vendor_params) do
      {:ok, vendor} ->
        notify_parent({:saved, vendor})

        {:noreply,
         socket
         |> put_flash(:info, "Vendor created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    assign(socket, :form, to_form(changeset))
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
