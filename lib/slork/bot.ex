defmodule Slork.Bot do
  use GenServer
  use Slack

  alias Slork.SlorkConfig

  def start_link do
    IO.puts "Starting bot..."

    api_token = SlorkConfig.get(:slack_api_token)
    unless api_token do
      raise Slork.Bot, message: "Invalid Slack API token: set the environment " <>
                                "variable SLORK_SLACK_API_TOKEN to a valid token."
    end
    Slork.Bot.start_link(api_token, [command_prefix: SlorkConfig.get(:command_prefix)])
  end

  def handle_message(message = %{type: "message"}, slack, state) do
    handle_text_message(message, slack, state)
    {:ok, state}
  end
  def handle_message(_, _, state), do: {:ok, state}

  # Private

  defp handle_text_message(message, slack, state) do
    if valid_message?(message, state) do
      Slork.Game.handle_message(message, slack)
      |> slack_send(message.channel, slack)
    end
  end

  defp valid_message?(message, state) do
    Map.has_key?(message, :text)
      && String.starts_with?(message.text, state[:command_prefix])
  end

  defp slack_send(text, channel, slack) do
    if text && String.length(text) > 0 do
      Slack.send_message(text, channel, slack)
    end
  end
end
