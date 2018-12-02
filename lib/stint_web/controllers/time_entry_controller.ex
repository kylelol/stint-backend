defmodule StintWeb.TimeEntryController do
  use StintWeb, :controller

  alias Stint.TimeTracking

  def start(conn, params) do
    TimeTracking.start_time_entry(conn.assigns.current_user, params["description"])
    conn
    |> put_status(:created)
    |> render("start.json")
  end

end
