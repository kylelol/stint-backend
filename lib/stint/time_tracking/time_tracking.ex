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

    response.body
  end

  defp create_client(user) do
    Toggl.Client.new(%{toggl_api_key: user.toggl_api_token}, :api)
  end

  defp create_v8_client(user) do
    Toggl.Client.new(%{toggl_api_key: user.toggl_api_token}, :v8)
  end

end
