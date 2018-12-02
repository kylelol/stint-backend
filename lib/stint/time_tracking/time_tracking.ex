defmodule Stint.TimeTracking do

  def start_time_entry(user, description \\ "") do
    client = Toggl.Client.new(%{toggl_api_key: user.toggl_api_token}, :api)
    response = Toggl.TimeEntries.start(client, %{description: description})
    response.body
  end

end
