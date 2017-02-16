defmodule ProPublica.Query.Members do
  import ProPublica

  @spec list(Client.t, binary, integer) :: ProPublica.response
  def list(client, chamber, congress \\ ProPublica.congress)
  def list(client, chamber, congress) when chamber in ["house", "senate"] do
    client |> get("/#{congress}/#{chamber}/members.json")
  end
  def list(_, _, _), do: invalid_chamber()

  @spec show(Client.t, integer) :: ProPublica.response
  def show(client, member_id), do: client |> get("/members/#{member_id}.json")

  @spec new(Client.t) :: ProPublica.response
  def new(client), do: client |> get("/members/new.json")

  @spec senators_from(Client.t, binary) :: ProPublica.response
  def senators_from(client, state) do
    client |> get("/members/senate/#{state}/current.json")
  end

  @spec house_members_from(Client.t, binary, integer) :: ProPublica.response
  def house_members_from(client, state, district) do
    client |> get("/members/house/#{state}/#{district}/current.json")
  end

  @spec leaving(Client.t, binary, integer) :: ProPublica.response
  def leaving(client, chamber, congress \\ ProPublica.congress)
  def leaving(client, chamber, congress) when chamber in ["house", "senate"] do
    client |> get("/#{congress}/#{chamber}/members/leaving.json")
  end
  def leaving(_, _, _), do: invalid_chamber()

  @spec votes(Client.t, integer) :: ProPublica.response
  def votes(client, member_id), do: client |> get("/members/#{member_id}/votes.json")

  @spec compare_votes(Client.t, binary, integer, integer, integer) :: ProPublica.response
  def compare_votes(client, chamber, left_id, right_id, congress \\ ProPublica.congress)
  def compare_votes(client, chamber, left_id, right_id, congress) when chamber in ["house", "senate"] do
    client |> get("/members/#{left_id}/votes/#{right_id}/#{congress}/#{chamber}.json")
  end
  def compare_votes(_, _, _, _, _), do: invalid_chamber()

  @spec compare_sponsorships(Client.t, binary, integer, integer, integer) :: ProPublica.response
  def compare_sponsorships(client, chamber, left_id, right_id, congress \\ ProPublica.congress)
  def compare_sponsorships(client, chamber, left_id, right_id, congress) when chamber in ["house", "senate"] do
    client |> get("/members/#{left_id}/bills/#{right_id}/#{congress}/#{chamber}.json")
  end
  def compare_sponsorships(_, _, _, _, _), do: invalid_chamber()

  @spec bills(Client.t, integer, binary) :: ProPublica.response
  def bills(client, member_id, bill_type) when bill_type in ["cosponsored", "withdrawn"] do
    client |> get("/members/#{member_id}/bills/#{bill_type}.json")
  end
  def bills(_, _, _), do: raise ArgumentError, message: "bill_type must be either cosponsored or withdrawn"

  @spec invalid_chamber :: no_return
  defp invalid_chamber, do: raise ArgumentError, message: "chamber must be either house or senate"
end
