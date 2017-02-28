defmodule ProPublica.Query.StateMembershipTest do
  use ExUnit.Case

  @client ProPublica.Client.new(System.get_env("TOKEN"))

  test "#list party membership by state" do
    %{"results" => %{"house" => _house, "senate" => _senate}} =
      @client |> ProPublica.Query.StateMembership.list
  end
end
