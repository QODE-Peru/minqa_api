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

  pipeline :auth do
    plug MinqaApi.Auth.AccessPipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  # Scope donde uno puede estar logueado o no
  scope "/", MinqaApiWeb do
    pipe_through [:browser, :auth] # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    delete "/logout", SessionController, :delete
  end

  # Scope donde uno tiene que estar logueado
  scope "/", MinqaApiWeb do
    pipe_through [:browser, :auth, :ensure_auth]
  end

  # Other scopes may use custom stacks.
  # scope "/api", MinqaApiWeb do
  #   pipe_through :api
  # end
end
