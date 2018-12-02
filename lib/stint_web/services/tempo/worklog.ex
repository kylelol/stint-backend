defmodule Tempo.Worklog do
  import Tempo

  def create(client, user, duration, description, start_date) do
    {:ok, start_date_time, _} = start_date |> DateTime.from_iso8601
    data = %{
      issueKey: description,
      timeSpentSeconds: duration,
      startDate: start_date_time |> DateTime.to_date |> Date.to_string,
      startTime: "00:00:00",
      authorUsername: user.tempo_username
    }

    post("worklogs", client, data)
  end

end
