defmodule ProPublica.Query.StateMembership do
  import ProPublica

  @spec list(Client.t) :: ProPublica.response
  def list(client), do: client |> get("/states/members/party.json")
end
