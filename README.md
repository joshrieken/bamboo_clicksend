# BambooClicksend

A [ClickSend](https://github.com/thoughtbot/bamboo) adapter for the
[Bamboo](https://github.com/thoughtbot/bamboo) email app.

## Installation

1. Add `bamboo_clicksend` to your list of dependencies in `mix.exs`

```elixir
def deps do
  [
    {:bamboo_clicksend, "~> 0.1.0"}
  ]
end
```

1. Setup your configuration

```
config :my_app, MyApp.Mailer,
  adapter: Bamboo.ClicksendAdapter,
  api_key: "F0E14CF8-1691-11E9-9019-C48E8FF5E241",
  username: "my_username",
  from_email_id: 4502
```

1. Follow Bamboo [Getting Started Guide](https://github.com/thoughtbot/bamboo#getting-started)

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bamboo_clicksend](https://hexdocs.pm/bamboo_clicksend).

