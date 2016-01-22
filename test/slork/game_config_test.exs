defmodule Slork.GameConfigTest do
  use ExUnit.Case
  alias Slork.GameConfig

  test "can store game config for a channel" do
    GameConfig.start_config
    assert GameConfig.get_config("not_created_yet") == []

    GameConfig.update_config("channel", ["command1", "command2"])
    assert GameConfig.get_config("channel") == ["command1", "command2"]
  end
end
