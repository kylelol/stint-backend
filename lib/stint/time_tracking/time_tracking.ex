defmodule Stint.TimeTracking do

  def start_time_entry(user, description \\ "") do
    response = user
      |> create_client
      |> Toggl.TimeEntries.start(%{description: description})
    response.body
  end

  def stop_time_entry(user, id) do
    response = user
      |> create_v8_client
      |> Toggl.TimeEntries.stop(id)

    data = response.body[:data]
    duration = data["duration"]
    description = data["description"]
    start_date = data["start"]

    tempo_client = Tempo.Client.new(%{tempo_api_key: user.tempo_api_key})
    tempo_response = Tempo.Worklog.create(tempo_client, user, duration, description, start_date)
    tempo_response.body
  end

  defp create_client(user) do
    Toggl.Client.new(%{toggl_api_key: user.toggl_api_token}, :nine)
  end

  defp create_v8_client(user) do
    Toggl.Client.new(%{toggl_api_key: user.toggl_api_token}, :eight)
  end

end
