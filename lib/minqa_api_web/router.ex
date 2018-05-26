defmodule MinqaApiWeb.Router do
  use MinqaApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth_html do
    plug MinqaApi.Auth.AccessHtmlPipeline
  end

  pipeline :ensure_html_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  pipeline :ensure_api_auth do
    plug MinqaApi.Auth.AccessApiPipeline
  end

  # Scope donde uno puede estar logueado o no
  scope "/", MinqaApiWeb do
    pipe_through [:browser, :auth_html] # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  # Scope donde uno tiene que estar logueado
  scope "/", MinqaApiWeb do
    pipe_through [:browser, :auth_html, :ensure_html_auth]
  end

  # Other scopes may use custom stacks.
  scope "/api", MinqaApiWeb do
    pipe_through :api

    post "/token", SessionApiController, :create
  end

  # Scope API donde uno tiene que estar logueado
  scope "/api", MinqaApiWeb do
    pipe_through [:api, :ensure_api_auth]

    get "/prueba", PageController, :api

    post "/account", AccountController, :show
    resources "/cuentas", CuentaController, except: [:new, :edit]
  end
end
