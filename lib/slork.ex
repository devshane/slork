defmodule Slork do
  use Application

  alias Slork.SlorkConfig

  def start(_type, args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Slork.Bot, []),
      worker(Slork.Game, [])
    ]

    SlorkConfig.start_config(args)

    opts = [strategy: :one_for_one, name: Slork.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc "Get a config value"
  def get_config(key), do: Application.get_env(:slork, key)
end
