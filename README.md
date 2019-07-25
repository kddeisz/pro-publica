# ProPublica Congress API

[![Build Status](https://travis-ci.org/kddeisz/pro-publica.svg?branch=master)](https://travis-ci.org/kddeisz/pro-publica)

An elixir wrapper around the ProPublica Congress API.

## Getting started

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

## Running tests

Get an API key from the maintainers (https://propublica.github.io/congress-api-docs) and put it into a file called `.token`. The run the tests with:

```
mix test
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kddeisz/pro-publica.

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
