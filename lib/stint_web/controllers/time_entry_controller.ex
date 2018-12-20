defmodule StintWeb.TimeEntryController do
  use StintWeb, :controller

  alias Stint.TimeTracking

  def start(conn, params) do
    IO.puts "here"
    time_entry = TimeTracking.start_time_entry(conn.assigns.current_user, params["description"])
    IO.puts "there"
    conn
    |> put_status(:created)
    |> render("start.json", time_entry: time_entry)
  end

  def stop(conn, %{"id" => id}) do
    TimeTracking.stop_time_entry(conn.assigns.current_user, id)
    conn
    |> put_status(:created)
    |> render("stop.json")
  end

  def test(conn, paras) do
    conn
    |> put_status(:created)
    |> render("test.json")
  end

end
