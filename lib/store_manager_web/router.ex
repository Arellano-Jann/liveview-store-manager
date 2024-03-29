defmodule StoreManagerWeb.Router do
  use StoreManagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {StoreManagerWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StoreManagerWeb do
    pipe_through :browser
    live "/stores", StoreLive.Index, :index
    live "/stores/new", StoreLive.Index, :new
    live "/stores/:id/edit", StoreLive.Index, :edit
    live "/stores/:id", StoreLive.Show, :show
    live "/stores/:id/show/edit", StoreLive.Show, :edit

    live "/companies", CompanyLive.Index, :index
    live "/companies/new", CompanyLive.Index, :new
    live "/companies/:id/edit", CompanyLive.Index, :edit
    live "/companies/:id", CompanyLive.Show, :show
    live "/companies/:id/show/edit", CompanyLive.Show, :edit

    live "/clerks", ClerkLive.Index, :index
    live "/clerks/new", ClerkLive.Index, :new
    live "/clerks/:id/edit", ClerkLive.Index, :edit
    live "/clerks/:id", ClerkLive.Show, :show
    live "/clerks/:id/show/edit", ClerkLive.Show, :edit

    live "/",CompanyLive.Index, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", StoreManagerWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:store_manager, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: StoreManagerWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
