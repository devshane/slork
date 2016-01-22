defmodule SlorkTest do
  use ExUnit.Case
  doctest Slork

  test "can get app config" do
    assert is_binary(Slork.get_config(:zork_tmp_dir))
  end
end
