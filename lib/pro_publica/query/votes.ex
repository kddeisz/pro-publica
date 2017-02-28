defmodule ProPublica.Query.Votes do
  import ProPublica

  @spec show(Client.t, binary, integer, integer, integer) :: ProPublica.response
  def show(client, chamber, session, number, congress \\ ProPublica.congress)
  def show(client, chamber, session, number, congress) when chamber in ["house", "senate"] and session in [1, 2] do
    client |> get("/#{congress}/#{chamber}/sessions/#{session}/votes/#{number}.json")
  end
  def show(_, _, _, _, _) do
    raise ArgumentError, message: "chamber must be either house or senate and session must be either 1 or 2"
  end

  @spec by_type(Client.t, binary, integer, integer) :: ProPublica.response
  def by_type(client, chamber, vote_type, congress \\ ProPublica.congress)
  def by_type(client, chamber, vote_type, congress) when chamber in ["house", "senate"] and vote_type in ["missed", "party", "loneno", "perfect"] do
    client |> get("/#{congress}/#{chamber}/votes/#{vote_type}.json")
  end
  def by_type(_, _, _, _) do
    raise ArgumentError, message: "chamber must be either house or senate and vote_type must be missed, party, loneno, or perfect"
  end

  @spec by_month(Client.t, binary, binary, binary) :: ProPublica.response
  def by_month(client, chamber, year, month) when chamber in ["house", "senate"] do
    client |> get("/#{chamber}/votes/#{year}/#{month}.json")
  end
  def by_month(_, _, _, _) do
    raise ArgumentError, message: "chamber must be either house or senate"
  end
end
