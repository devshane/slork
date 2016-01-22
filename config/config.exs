use Mix.Config

config :logger, truncate: 99999

config :slork, command_prefix: "!"
config :slork, slack_api_token: System.get_env("SLORK_SLACK_API_TOKEN")
config :slork, zork_dir: "#{File.cwd!}/zork"
config :slork, zork_tmp_dir: "/tmp"
