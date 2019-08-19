defmodule UrlboiWeb.Router do
  use UrlboiWeb, :router

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

  scope "/", UrlboiWeb do
    pipe_through :browser

    get "/", PageController, :index
    post "/", PageController, :create
    get "/:shortpath", RedirectController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", UrlboiWeb do
    pipe_through :api

    resources "/short_urls", ShortUrlController, except: [:new, :edit]
  end
end
