defmodule PharmaPriceWeb.VendorLiveTest do
  use PharmaPriceWeb.ConnCase

  import Phoenix.LiveViewTest
  import PharmaPrice.VendorsFixtures

  @create_attrs %{
    name: "some name",
    description: "some description",
    logo: "some logo",
    logo_type: "some logo_type"
  }
  @update_attrs %{
    name: "some updated name",
    description: "some updated description",
    logo: "some updated logo",
    logo_type: "some updated logo_type"
  }
  @invalid_attrs %{name: nil, description: nil, logo: nil, logo_type: nil}

  defp create_vendor(_) do
    vendor = vendor_fixture()
    %{vendor: vendor}
  end

  describe "Index" do
    setup [:create_vendor]

    test "lists all vendors", %{conn: conn, vendor: vendor} do
      {:ok, _index_live, html} = live(conn, ~p"/vendors")

      assert html =~ "Listing Vendors"
      assert html =~ vendor.name
    end

    test "saves new vendor", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/vendors")

      assert index_live |> element("a", "New Vendor") |> render_click() =~
               "New Vendor"

      assert_patch(index_live, ~p"/vendors/new")

      assert index_live
             |> form("#vendor-form", vendor: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#vendor-form", vendor: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/vendors")

      html = render(index_live)
      assert html =~ "Vendor created successfully"
      assert html =~ "some name"
    end

    test "updates vendor in listing", %{conn: conn, vendor: vendor} do
      {:ok, index_live, _html} = live(conn, ~p"/vendors")

      assert index_live |> element("#vendors-#{vendor.id} a", "Edit") |> render_click() =~
               "Edit Vendor"

      assert_patch(index_live, ~p"/vendors/#{vendor}/edit")

      assert index_live
             |> form("#vendor-form", vendor: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#vendor-form", vendor: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/vendors")

      html = render(index_live)
      assert html =~ "Vendor updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes vendor in listing", %{conn: conn, vendor: vendor} do
      {:ok, index_live, _html} = live(conn, ~p"/vendors")

      assert index_live |> element("#vendors-#{vendor.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#vendors-#{vendor.id}")
    end
  end

  describe "Show" do
    setup [:create_vendor]

    test "displays vendor", %{conn: conn, vendor: vendor} do
      {:ok, _show_live, html} = live(conn, ~p"/vendors/#{vendor}")

      assert html =~ "Show Vendor"
      assert html =~ vendor.name
    end

    test "updates vendor within modal", %{conn: conn, vendor: vendor} do
      {:ok, show_live, _html} = live(conn, ~p"/vendors/#{vendor}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Vendor"

      assert_patch(show_live, ~p"/vendors/#{vendor}/show/edit")

      assert show_live
             |> form("#vendor-form", vendor: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#vendor-form", vendor: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/vendors/#{vendor}")

      html = render(show_live)
      assert html =~ "Vendor updated successfully"
      assert html =~ "some updated name"
    end
  end
end
