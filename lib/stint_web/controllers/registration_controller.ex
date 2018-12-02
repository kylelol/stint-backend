defmodule StintWeb.Auth.RegistrationController do
  use StintWeb, :controller

  def create(conn, %{"toggl_api_key" => toggl_api_key}) do
    client = Toggl.Client.new(%{toggl_api_key: toggl_api_key}, :api)
    response = Toggl.get("me", client)
    IO.puts response
  end

end
