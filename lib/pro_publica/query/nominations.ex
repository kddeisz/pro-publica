defmodule ProPublica.Query.Nominations do
  import ProPublica

  @nominee_types ["received", "updated", "confirmed", "withdrawn"]

  @spec list(Client.t, integer) :: ProPublica.response
  def list(client, congress \\ ProPublica.congress) do
    client |> get("/#{congress}/nominations.json")
  end

  @spec nominees(Client.t, binary, integer) :: ProPublica.response
  def nominees(client, nominee_type, congress \\ ProPublica.congress)
  def nominees(client, nominee_type, congress) when nominee_type in @nominee_types do
    client |> get("/#{congress}/nominees/#{nominee_type}.json")
  end
  def nominees(_, _, _) do
    raise ArgumentError, message: "nominee_type must be one of received, updated, confirmed, or withdrawn"
  end

  @spec nominee(Client.t, integer, integer) :: ProPublica.response
  def nominee(client, nominee_id, congress \\ ProPublica.congress) do
    client |> get("/#{congress}/nominees/#{nominee_id}")
  end

  @spec by_state(Client.t, binary, integer) :: ProPublica.response
  def by_state(client, state, congress \\ ProPublica.congress) do
    client |> get("/#{congress}/nominees/state/#{state}.json")
  end
end
