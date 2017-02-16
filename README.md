# ProPublica Congress API

A wrapper around the ProPublica Congress API.

## Quickstart

First, add `pro_publica` to your `mix.exs` dependencies:

```elixir
def deps do
  [{:pro_publica, "~> 0.0.1"}]
end
```

Ensure that `pro_publica` is added as an application in your `mix.exs`:

```elixir
def application do
  [applications: [:pro_publica]]
end
```

Fetching dependencies and running on elixir console:

```elixir
mix deps.get
iex -S mix
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kddeisz/pro-publica.
