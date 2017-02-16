defmodule ProPublica.Query.Members do
  import ProPublica

  def list(client, chamber, congress \\ ProPublica.congress)
  def list(client, chamber, congress) when chamber in ["house", "senate"] do
    client |> get("/#{congress}/#{chamber}/members.json")
  end
  def list(_, _, _), do: invalid_chamber()

  def show(client, id), do: client |> get("/members/#{id}.json")

  def new(client), do: client |> get("/members/new.json")

  def senators_from(client, state) do
    client |> get("/members/senate/#{state}/current.json")
  end

  def house_members_from(client, state, district) do
    client |> get("/members/house/#{state}/#{district}/current.json")
  end

  def leaving(client, chamber, congress \\ ProPublica.congress)
  def leaving(client, chamber, congress) when chamber in ["house", "senate"] do
    client |> get("/#{congress}/#{chamber}/members/leaving.json")
  end
  def leaving(_, _, _), do: invalid_chamber()

  def votes(client, id), do: client |> get("/members/#{id}/votes.json")

  def compare_votes(client, chamber, left_id, right_id, congress \\ ProPublica.congress)
  def compare_votes(client, chamber, left_id, right_id, congress) when chamber in ["house", "senate"] do
    client |> get("/members/#{left_id}/votes/#{right_id}/#{congress}/#{chamber}.json")
  end
  def compare_votes(_, _, _, _, _), do: invalid_chamber()

  def compare_sponsorships(client, chamber, left_id, right_id, congress \\ ProPublica.congress)
  def compare_sponsorships(client, chamber, left_id, right_id, congress) when chamber in ["house", "senate"] do
    client |> get("/members/#{left_id}/bills/#{right_id}/#{congress}/#{chamber}.json")
  end
  def compare_sponsorships(_, _, _, _, _), do: invalid_chamber()

  def bills(client, id, bill_type) when bill_type in ["cosponsored", "withdrawn"] do
    client |> get("/members/#{id}/bills/#{bill_type}.json")
  end
  def bills(_, _, _), do: raise ArgumentError, message: "bill_type must be either cosponsored or withdrawn"

  defp invalid_chamber, do: raise ArgumentError, message: "chamber must be either house or senate"
end
