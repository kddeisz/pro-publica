defmodule ProPublica do
  alias ProPublica.Client

  @congress 115
  @base "https://api.propublica.org/congress/v1"

  @type response :: {integer, String.t} | :jsx.json_term

  @spec congress :: 115
  def congress, do: @congress

  @spec get(Client.t, binary) :: response
  def get(client, path) do
    HTTPoison.request!(:get, @base <> path, "", client |> headers) |> process
  end

  @spec headers(Client.t) :: [{String.t, String.t}]
  defp headers(%Client{token: token}), do: [{"X-API-Key", token}]

  @spec process(HTTPoison.Response.t) :: response
  defp process(%HTTPoison.Response{status_code: 200, body: body}), do: JSX.decode!(body)
  defp process(%HTTPoison.Response{status_code: status_code, body: body}), do: {status_code, body}
end
