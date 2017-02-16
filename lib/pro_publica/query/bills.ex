defmodule ProPublica.Query.Bills do
  import ProPublica

  @bill_types ["introduced", "updated", "passed", "major"]
  @metadata_types ["subjects", "amendments", "related"]

  @spec recent(Client.t, binary, integer, integer) :: ProPublica.response
  def recent(client, chamber, bill_type, congress \\ ProPublica.congress)
  def recent(client, chamber, bill_type, congress) when chamber in ["house", "senate"] and bill_type in @bill_types do
    client |> get("/#{congress}/#{chamber}/bills/#{bill_type}.json")
  end
  def recent(_, _, _, _) do
    raise ArgumentError, message: "chamber must be either house or senate and bill_type must be introduced, updated, passed, or major"
  end

  @spec recent_by(Client.t, integer, binary) :: ProPublica.response
  def recent_by(client, member_id, bill_type) when bill_type in ["introduced", "updated"] do
    client |> get("/members/#{member_id}/bills/#{bill_type}.json")
  end
  def recent_by(_, _, _) do
    raise ArgumentError, message: "bill_type must be either introduced or updated"
  end

  @spec show(Client.t, integer, integer) :: ProPublica.response
  def show(client, bill_id, congress \\ ProPublica.congress) do
    client |> get("/#{congress}/bills/#{bill_id}.json")
  end

  @spec show_metadata(Client.t, integer, binary, integer) :: ProPublica.response
  def show_metadata(client, bill_id, metadata_type, congress \\ ProPublica.congress)
  def show_metadata(client, bill_id, metadata_type, congress) when metadata_type in @metadata_types do
    client |> get("/#{congress}/bills/#{bill_id}/#{metadata_type}.json")
  end
  def show_metadata(_, _, _, _) do
    raise ArgumentError, message: "metadata_type must be one of subjects, amendments, or related"
  end

  @spec cosponsors(Client.t, integer, integer) :: ProPublica.response
  def cosponsors(client, bill_id, congress \\ ProPublica.congress) do
    client |> get("/#{congress}/bills/#{bill_id}/cosponsors.json")
  end
end
