defmodule Toggl.TimeEntries do
  import Toggl
  alias Toggl.Client

  def start(client, time_entry_data) do
    current_date = DateTime.utc_now
    current_date_unix = current_date |> DateTime.to_unix
    data = %{
      start: current_date |> DateTime.to_iso8601,
      duration: -current_date_unix,
      wid: 2290073,
      created_with: "stint"
    }
    body = Map.merge(time_entry_data, data)
    post("time_entries", client, body)
  end

  def stop(client, time_entry_id) do
    put("time_entries/#{time_entry_id}/stop", client)
  end

end
