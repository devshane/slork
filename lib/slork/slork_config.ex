defmodule Slork.SlorkConfig do
  def start_config(options) when is_list(options) do
    defaults = %{command_prefix: Slork.get_config(:command_prefix),
                 map_url: Slork.get_config(:map_url),
                 slack_api_token: Slork.get_config(:slack_api_token),
                 zork_dir: Slork.get_config(:zork_dir),
                 zork_tmp_dir: Slork.get_config(:zork_tmp_dir)}
    opts = Map.merge(defaults, Enum.into(options, %{}))
    Agent.start_link(fn -> opts end, name: __MODULE__)
  end
  def start_config, do: start_config([])

  def get(key) do
    Agent.get(__MODULE__, fn map -> Map.get(map, key) end)
  end

  def set(key, value) do
    Agent.update(__MODULE__, fn map -> Map.put(map, key, value) end)
  end
end
