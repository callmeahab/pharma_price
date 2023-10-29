# PharmaPrice

Setup:

  * Install XCode
  * Install homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
  * Install postgres: `brew install postgresql@16`
  * Start postgres service: `brew services start postgresql`
  * Install elixir: `brew install elixir`
  * Run: `mix local.hex`
  * Run: `mix archive.install hex phx_new`
  * Run: `echo 'export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"' >> ~/.zshrc`
  * Run: `createdb ${currentuser}` -- replace ${currentuser} with your user name
  * Run: `createuser postgres`
  * Run: `createdb postgres`
  * Run: `psql`
  * Run: `alter user postgres with superuser;`
  * Run: `brew install meilisearch`
  * Run: `brew services start meilisearch`


To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
