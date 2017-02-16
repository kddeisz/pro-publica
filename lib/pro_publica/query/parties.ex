defmodule ProPublica.Query.Parties do
  import ProPublica

  def membership(client), do: client |> get("/states/members/party.json")
end
