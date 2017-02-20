defmodule ProPublica.Query.BillsTest do
  use ExUnit.Case

  @client ProPublica.Client.new(System.get_env("TOKEN"))

  test "#recent introduced in the senate" do
    %{"results" => [%{"bills" => _bills}]} =
      @client |> ProPublica.Query.Bills.recent("senate", "introduced", 115)
  end

  test "#recent_by introduced by member C001098" do
    %{"results" => [%{"bills" => _bills}]} =
      @client |> ProPublica.Query.Bills.recent_by("C001098", "introduced")
  end

  test "#show bill s375" do
    %{"results" => [%{"actions" => _actions}]} =
      @client |> ProPublica.Query.Bills.show("s375", 115)
  end

  test "#metadata bill s375 amendments" do
    %{"results" => [%{"amendments" => _amendments}]} =
      @client |> ProPublica.Query.Bills.metadata("s375", "amendments", 115)
  end

  test "#cosponsors bill s375" do
    %{"results" => [%{"cosponsors" => _cosponsors}]} =
      @client |> ProPublica.Query.Bills.cosponsors("s375", 115)
  end
end
