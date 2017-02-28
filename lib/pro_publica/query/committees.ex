defmodule ProPublica.Query.Committees do
  import ProPublica

  @spec list(Client.t, binary, integer) :: ProPublica.response
  def list(client, chamber, congress \\ ProPublica.congress)
  def list(client, chamber, congress) when chamber in ["house", "senate"] do
    client |> get("/#{congress}/#{chamber}/committees.json")
  end
  def list(_, _, _), do: invalid_chamber()

  @spec show(Client.t, binary, integer, integer) :: ProPublica.response
  def show(client, chamber, committee_id, congress \\ ProPublica.congress)
  def show(client, chamber, committee_id, congress) when chamber in ["house", "senate"] do
    client |> get("/#{congress}/#{chamber}/committees/#{committee_id}.json")
  end
  def show(_, _, _, _), do: invalid_chamber()

  @spec invalid_chamber :: no_return
  defp invalid_chamber, do: raise ArgumentError, message: "chamber must be either house or senate"
end
