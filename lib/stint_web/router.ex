defmodule StintWeb.Router do
  use StintWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :require_auth do
    plug StintWeb.Plugs.AuthenticateUser
  end

  scope "/api", StintWeb do
    pipe_through :api

    get "/test", TimeEntryController, :test

    scope "/auth", Auth do
      post "/registration", RegistrationController, :create
    end

    pipe_through :require_auth

    post "/time_entries", TimeEntryController, :start
    put "/time_entries/:id", TimeEntryController, :stop

    get "/test", TestController, :index
  end
end
