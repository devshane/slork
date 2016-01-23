defmodule Slork.SlorkConfigTest do
  use ExUnit.Case
  alias Slork.SlorkConfig

  test "can store slork config" do
    SlorkConfig.start_config
    assert SlorkConfig.get("not_created_yet") == nil

    SlorkConfig.set(:command_prefix, "!")
    assert SlorkConfig.get(:command_prefix) == "!"
  end

  test "can setup config based on options" do
    SlorkConfig.start_config([option: "value"])
    assert SlorkConfig.get(:option) == "value"
  end
end
