defmodule Slork.GameConfig do
  def start_config do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def get_config(channel) do
    Agent.get(__MODULE__, fn map -> Map.get(map, channel) || [] end)
  end

  def update_config(channel, commands) do
    Agent.update(__MODULE__, fn map -> Map.put(map, channel, commands) end)
  end

  def reset(channel) do
    Agent.update(__MODULE__, fn map -> Map.delete(map, channel) end)
  end
end
