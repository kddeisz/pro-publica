defmodule ProPublica.Query.Nominations do
  import ProPublica

  @nominee_types ["received", "updated", "confirmed", "withdrawn"]

  def nominees(client, nominee_type, congress \\ ProPublica.congress) when nominee_type in @nominee_types do
    client |> get("/#{congress}/nominees/#{nominee_type}.json")
  end
  def nominess(_, _, _) do
    raise ArgumentError, message: "nominee_type must be one of received, updated, confirmed, or withdrawn"
  end

  def nominee(client, nominee_id, congress \\ ProPublica.congress) do
    client |> get("/#{congress}/nominees/#{nominee_id}")
  end

  def by_state(client, state, congress \\ ProPublica.congress) do
    client |> get("/#{congress}/nominees/state/#{state}.json")
  end
end
