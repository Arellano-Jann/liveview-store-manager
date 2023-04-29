# StoreManager

changed files:

store_manager:
business/company.ex # schemas
business/store.ex
business.ex # context file

store_manager_web:
live/store_live/index.ex # 3
live/store_live/form_component.ex # 1 (select button)
live/store_live/*.html.heex # 1 (pass in to form component on the bottom of file) (other changes that can be shown on the screen if wanter)
live/company_live

router.ex

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
