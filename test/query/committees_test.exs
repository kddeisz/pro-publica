defmodule ProPublica.Query.CommitteesTest do
  use ExUnit.Case

  @client ProPublica.Client.new(System.get_env("TOKEN"))

  test "#list committees in the senate" do
    %{"results" => [%{"chamber" => "Senate", "committees" => _committees}]} =
      @client |> ProPublica.Query.Committees.list("senate", 115)
  end

  test "#show a specific committee in the senate" do
    %{"results" => [%{"chamber" => "Senate", "current_members" => _current_members}]} =
      @client |> ProPublica.Query.Committees.show("senate", "SSAF", 115)
  end
end
