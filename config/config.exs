# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :pharma_price,
  ecto_repos: [PharmaPrice.Repo]

# Configures the endpoint
config :pharma_price, PharmaPriceWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [html: PharmaPriceWeb.ErrorHTML, json: PharmaPriceWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: PharmaPrice.PubSub,
  live_view: [signing_salt: "NMxb2Hva"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :pharma_price, PharmaPrice.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.3.2",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :crawly,
  # closespider_timeout: 10,
  concurrent_requests_per_domain: 20,
  # closespider_itemcount: 100,
  middlewares: [
    {Crawly.Middlewares.UserAgent,
     user_agents: [
       "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36"
     ]}
  ],
  pipelines: [
    {Crawly, fields: ["title", "price", "link", "image"]},
    {Crawly.Pipelines.WriteToFile, folder: "/tmp", extension: "csv"}
  ]

config :flop, repo: PharmaPrice.Repo

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
