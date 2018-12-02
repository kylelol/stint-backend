defmodule StintWeb.Router do
  use StintWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", StintWeb do
    pipe_through :api

    scope "/auth", Auth do
      post "/registration", RegistrationController, :create
    end

    get "/test", TestController, :index
  end
end
