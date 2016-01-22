defmodule Slork.GameTest do
  use ExUnit.Case

  alias Slork.Game

  test "can run a command" do
    message = %{ text: "!l", channel: "@slork" }
    response = Game.handle_message(message, nil)
    assert response =~ "There is a small mailbox here"
  end
end
