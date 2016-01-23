defmodule Slork.GameTest do
  use ExUnit.Case

  alias Slork.{Game,SlorkConfig}

  test "can run a command" do
    SlorkConfig.start_link
    Game.start_link
    message = %{ text: "!l", channel: "@slork" }
    response = Game.handle_message(message, nil)
    assert response =~ "There is a small mailbox here"
  end
end
