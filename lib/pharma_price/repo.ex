defmodule PharmaPrice.Repo do
  use Ecto.Repo,
    otp_app: :pharma_price,
    adapter: Ecto.Adapters.Postgres
end
