# Mastery

This application is the project created following
[Designing Elixir Systems with OTP](https://pragprog.com/titles/jgotp/designing-elixir-systems-with-otp).
The goal is to create an application using the following layers:

- **Data** with domain models.
- **Functional core** holding the business logic.
- **Tests** for our core.
- **Boundary** to provide an API for our core (processes).
- **Lifecycle** with the tools (supervisors) to manage the boundary layer.
- **Workers** to divide work in order to achieve performance, isolation, and
  reliability.

It was created using a different version of Elixir (ahead of the book), so it
required a few minor tweaks.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mastery` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mastery, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/mastery>.
