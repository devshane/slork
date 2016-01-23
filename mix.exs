defmodule Slork.Mixfile do
  use Mix.Project

  def project do
    [app: :slork,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     escript: [main_module: Slork.CLI],
     deps: deps]
  end

  def application do
    [applications: [:logger, :slack]]
  end

  defp deps do
    [
      {:poison, "~> 1.5"},
      {:slack, "~> 0.3.0"},
      {:websocket_client, git: "https://github.com/jeremyong/websocket_client"},

      {:mix_test_watch, "~> 0.2", only: :dev}
    ]
  end
end
