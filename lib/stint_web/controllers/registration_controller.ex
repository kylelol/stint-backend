defmodule StintWeb.Auth.RegistrationController do
  use StintWeb, :controller

  alias Stint.Accounts
  alias Stint.Accounts.User

  action_fallback StintWeb.FallbackController

  def create(conn, %{"toggl_api_key" => toggl_api_key}) do
    client = Toggl.Client.new(%{toggl_api_key: toggl_api_key}, :api)
    response = Toggl.get("me", client)
    user_params = %{
      email: response[:email],
      default_workspace_id: response[:default_workspace_id],
      toggl_api_token: toggl_api_key
    }

    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

end
