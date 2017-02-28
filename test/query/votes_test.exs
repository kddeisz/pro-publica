defmodule ProPublica.Query.VotesTest do
  use ExUnit.Case

  @client ProPublica.Client.new(System.get_env("TOKEN"))

  test "#roll_call lists the votes for a specific roll call vote" do
    %{"results" => %{"votes" => %{"vote" => %{"bill" => _bill}}}} =
      @client |> ProPublica.Query.Votes.roll_call("senate", 1, 1)
  end

  test "#by_type lists votes by vote type" do
    %{"results" => [%{"chamber" => "Senate", "members" => _members}]} =
      @client |> ProPublica.Query.Votes.by_type("senate", "party")
  end

  test "#by_month lists votes by month" do
    %{"results" => %{"chamber" => "Senate", "votes" => _votes}} =
      @client |> ProPublica.Query.Votes.by_month("senate", "2017", "01")
  end
end
