defmodule Toggl do
  use HTTPoison.Base

  @user_agent []

  def get(path, client) do
    initial_url = url(client, path)
    _request(:get, initial_url, client.auth)
  end

  def process_response(response) do
    Poison.decode!(response.body, keys: :atoms)
  end

  def _request(method, url, auth, body \\ "") do
    json_request(method, url, body, authorization_header(auth, @user_agent))
  end

  def json_request(method, url, body \\ "", headers \\ [], options \\ []) do
    case body do
      "" ->
        request!(method, url, "", headers, options)
        |> process_response
      _ ->
        request!(method, url, Poison.encode!(body), headers, options)
        |> process_response
    end
  end

  def authorization_header(%{toggl_api_key: toggl_api_key}, headers) do
    encoded = Base.encode64("#{toggl_api_key}:api_token")
    headers ++ [{"Authorization", "Basic #{encoded}"}]
  end

  defp add_params_to_url(url, params) do
    <<url :: binary, build_qs(params) :: binary>>
  end

  defp build_qs([]), do: ""
  defp build_qs(kvs), do: to_string('?' ++ URI.encode_query(kvs))

  defp url(%{endpoint: endpoint}, path) do
    endpoint <> "/" <> path
  end

  defp is_json_response(response) do
    Enum.find(response.headers, fn(x) -> elem(x, 0) == "Content-Type" end)
    |> elem(1)
    |> String.contains?("application/json")
  end
end
