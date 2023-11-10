defmodule PharmaPriceWeb.PharmaPriceWeb.PageLive.Index do
  alias PharmaPrice.Accounts
  alias PharmaPrice.Products
  alias PharmaPrice.Vendors
  alias PharmaPriceWeb.{ItemCard, ItemDetails, Header}
  use PharmaPriceWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    products =
      case Products.paginated_products(1) do
        {:ok, {products, _meta}} -> products
        _ -> []
      end

    {:ok,
     socket
     |> assign(
       :current_user,
       case Map.get(session, "user_token") do
         nil -> nil
         user_token -> Accounts.get_user_by_session_token(user_token)
       end
     )
     |> assign(:items, products)
     |> assign(:vendors, Vendors.list_vendors())
     |> assign(:product, nil)
     |> assign(:cart, %{})
     |> assign(:q, nil)
     |> assign(:search_results, [])}
  end

  @impl true
  def handle_event("inc_count", %{"id" => id}, socket) do
    {id, _} = Integer.parse(id)

    cart =
      case Map.get(socket.assigns.cart, id) do
        nil ->
          socket.assigns.cart |> Map.put(id, %{"count" => 1})

        item ->
          %{
            socket.assigns.cart
            | id => %{
                item
                | "count" => item["count"] + 1
              }
          }
      end

    {:noreply, assign(socket, :cart, cart)}
  end

  @impl true
  def handle_event("dec_count", %{"id" => id}, socket) do
    {id, _} = Integer.parse(id)

    cart =
      case Map.get(socket.assigns.cart, id) do
        nil ->
          socket.assigns.cart

        item ->
          if item["count"] > 0 do
            %{socket.assigns.cart | id => %{item | "count" => item["count"] - 1}}
          else
            socket.assings.cart
          end
      end

    {:noreply, assign(socket, :cart, cart)}
  end

  @impl true
  def handle_event("search", %{"search" => q}, socket) do
    {:ok, results} =
      Meilisearch.Search.search("products_index", q)

    results =
      results["hits"]
      |> Enum.map(fn r -> r |> Map.new(fn {k, v} -> {String.to_atom(k), v} end) end)

    {:noreply, socket |> assign(:search_results, results)}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :details, %{"id" => id}) do
    socket
    |> assign(:product, Products.get_product!(id))
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:product, nil)
  end
end
