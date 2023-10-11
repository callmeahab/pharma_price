# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PharmaPrice.Repo.insert!(%PharmaPrice.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

PharmaPrice.Repo.insert!(%PharmaPrice.Vendors.Vendor{
  name: "Srbotrade Apoteka",
  description: "Srbotrade Apoteka",
  logo: "/images/srbotrade-header-logo.jpeg",
  logo_type: "image/jpeg"
})
