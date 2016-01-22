defmodule Slork do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Slork.Bot, []),
      worker(Slork.Game, [])
    ]

    opts = [strategy: :one_for_one, name: Slork.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc "Get a config value"
  def get_config(key), do: Application.get_env(:slork, key)
end
