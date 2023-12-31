defmodule Mastery.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Mastery.Boundary.QuizManager, [name: Mastery.Boundary.QuizManager]},
      {Registry, [name: Mastery.Registry.QuizSession, keys: :unique]},
      {Mastery.Boundary.Proctor, [name: Mastery.Boundary.Proctor]},
      {DynamicSupervisor, [name: Mastery.Supervisor.QuizSession, strategy: :one_for_one]}
    ]

    opts = [strategy: :one_for_one, name: Mastery.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
