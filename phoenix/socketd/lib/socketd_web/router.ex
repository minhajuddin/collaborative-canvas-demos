defmodule SocketdWeb.Router do
  use SocketdWeb, :router

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

  scope "/", SocketdWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/stats", PageController, :stats
  end

  # Other scopes may use custom stacks.
  # scope "/api", SocketdWeb do
  #   pipe_through :api
  # end
end
