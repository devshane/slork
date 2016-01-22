defmodule Slork.Game do
  use GenServer
  require Logger

  alias Slork.GameConfig

  def start_link do
    GameConfig.start_config
    GenServer.start_link(__MODULE__, [], name: SlorkGamePid)
  end

  def handle_message(message, _slack) do
    if String.starts_with?(message.text, Slork.get_config(:command_prefix)) do
      cmd =
        message.text
        |> String.slice(1, 999)
        |> String.strip
      run_command(message.channel, cmd) |> format_response
    end
  end

  def run_command(channel, command) do
    commands = GameConfig.get_config(channel) ++ [command]
    if length(commands) == 1 do
      Logger.info("loading existing game for #{channel}")
      load_existing_game(channel)
      run_command(channel, command)
    else
      GameConfig.update_config(channel, commands)
      GenServer.call(SlorkGamePid, {:run_command, channel, commands})
    end
  end

  def handle_call({:run_command, channel, commands}, _from, state) do
    response = write_command_file(channel, commands) |> run_zork
    {:reply, response, state}
  end

  # Private

  defp format_response(response) do
    out = response
      |> String.strip
      |> String.replace("\t", " ")
      |> String.split("\n>")
      |> Enum.reject(fn x -> x == "" end)
      |> Enum.at(-1)
    "```#{out}```"
  end

  defp load_existing_game(channel) do
    file = zork_file(channel)
    commands =
      if File.exists?(file) do
        File.read!(file) |> String.split("\n")
      else
        ["l"] # prevent loops in run_command
      end
    GameConfig.update_config(channel, commands)
  end

  defp write_command_file(channel, commands) do
    command_text = Enum.join(commands, "\n")
    file = zork_file(channel)
    File.write!(file, command_text)

    file
  end

  defp run_zork(file) do
    args = ["-c", "(cd #{zork_dir}; cat #{file} | ./zork 2> /dev/null)"]
    {response, _} = System.cmd("bash", args)
    response
  end

  defp zork_dir, do: Slork.get_config(:zork_dir)
  defp zork_tmp_dir, do: Slork.get_config(:zork_tmp_dir)
  defp zork_file(channel), do: "#{zork_tmp_dir}/zork-commands-#{channel}"
end
