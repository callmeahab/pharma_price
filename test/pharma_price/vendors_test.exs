defmodule PharmaPrice.VendorsTest do
  use PharmaPrice.DataCase

  alias PharmaPrice.Vendors

  describe "vendors" do
    alias PharmaPrice.Vendors.Vendor

    import PharmaPrice.VendorsFixtures

    @invalid_attrs %{name: nil, description: nil, logo: nil, logo_type: nil}

    test "list_vendors/0 returns all vendors" do
      vendor = vendor_fixture()
      assert Vendors.list_vendors() == [vendor]
    end

    test "get_vendor!/1 returns the vendor with given id" do
      vendor = vendor_fixture()
      assert Vendors.get_vendor!(vendor.id) == vendor
    end

    test "create_vendor/1 with valid data creates a vendor" do
      valid_attrs = %{name: "some name", description: "some description", logo: "some logo", logo_type: "some logo_type"}

      assert {:ok, %Vendor{} = vendor} = Vendors.create_vendor(valid_attrs)
      assert vendor.name == "some name"
      assert vendor.description == "some description"
      assert vendor.logo == "some logo"
      assert vendor.logo_type == "some logo_type"
    end

    test "create_vendor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vendors.create_vendor(@invalid_attrs)
    end

    test "update_vendor/2 with valid data updates the vendor" do
      vendor = vendor_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", logo: "some updated logo", logo_type: "some updated logo_type"}

      assert {:ok, %Vendor{} = vendor} = Vendors.update_vendor(vendor, update_attrs)
      assert vendor.name == "some updated name"
      assert vendor.description == "some updated description"
      assert vendor.logo == "some updated logo"
      assert vendor.logo_type == "some updated logo_type"
    end

    test "update_vendor/2 with invalid data returns error changeset" do
      vendor = vendor_fixture()
      assert {:error, %Ecto.Changeset{}} = Vendors.update_vendor(vendor, @invalid_attrs)
      assert vendor == Vendors.get_vendor!(vendor.id)
    end

    test "delete_vendor/1 deletes the vendor" do
      vendor = vendor_fixture()
      assert {:ok, %Vendor{}} = Vendors.delete_vendor(vendor)
      assert_raise Ecto.NoResultsError, fn -> Vendors.get_vendor!(vendor.id) end
    end

    test "change_vendor/1 returns a vendor changeset" do
      vendor = vendor_fixture()
      assert %Ecto.Changeset{} = Vendors.change_vendor(vendor)
    end
  end
end
