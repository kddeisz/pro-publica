defmodule ProPublica.Query.Committees do
  import ProPublica

  def membership(client, chamber, congress \\ ProPublica.congress)
  def membership(client, chamber, congress) when chamber in ["house", "senate"] do
    client |> get("/#{congress}/#{chamber}/committees.json")
  end
  def membership(_, _, _), do: invalid_chamber()

  def membership_for(client, chamber, committee_id, congress \\ ProPublica.congress)
  def membership_for(client, chamber, committee_id, congress) when chamber in ["house", "senate"] do
    client |> get("/#{congress}/#{chamber}/committees/#{committee_id}.json")
  end
  def membership_for(_, _, _, _), do: invalid_chamber()

  defp invalid_chamber, do: raise ArgumentError, message: "chamber must be either house or senate"
end
