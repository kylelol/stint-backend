defmodule StintWeb.Plugs.AuthenticateUser do
  import Plug.Conn
  alias Stint.Accounts

  def init(_opts), do: nil

  def call(%Plug.Conn{} = conn, _opts) do
    case get_req_header(conn, "x-user-id") do
      [user_id] ->
        fetch_user(conn, user_id)
      _ ->
        conn
        |> halt
    end

  end

  defp fetch_user(conn, user_id) do
    case Accounts.get_user_by_toggl_api_token(user_id) do
      nil ->
        conn
        |> halt
      user ->
        conn
        |> assign(:current_user, user)
    end
  end

end
