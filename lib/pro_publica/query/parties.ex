defmodule ProPublica.Query.Parties do
  import ProPublica

  @spec membership(Client.t) :: ProPublica.response
  def membership(client), do: client |> get("/states/members/party.json")
end
