defmodule StintWeb.UserController do
  use StintWeb, :controller

  alias Stint.Accounts
  alias Stint.Accounts.User

  action_fallback StintWeb.FallbackController

end
