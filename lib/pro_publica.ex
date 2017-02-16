defmodule ProPublica do
  alias ProPublica.Client

  @congress 115
  @base "https://api.propublica.org/congress/v1"

  def congress, do: @congress

  def get(client, path) do
    HTTPoison.request!(:get, @base <> path, "", client |> headers) |> process
  end

  defp headers(%Client{token: token}), do: [{"X-API-Key", token}]

  defp process(%HTTPoison.Response{status_code: 200, body: body}), do: JSX.decode!(body)
  defp process(%HTTPoison.Response{status_code: status_code, body: body}), do: {status_code, body}
end
