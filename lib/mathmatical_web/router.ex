defmodule MathmaticalWeb.Router do
  use MathmaticalWeb, :router

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

  scope "/", MathmaticalWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/questions", QuestionController
  end

  # Other scopes may use custom stacks.
  # scope "/api", MathmaticalWeb do
  #   pipe_through :api
  # end
end
