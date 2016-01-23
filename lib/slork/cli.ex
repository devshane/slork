defmodule Slork.CLI do
  @doc """
  Starts the bot

  ./slork [--command-prefix PREFIX]
          [--map-url URL]
          [--slack-api-token DONTDOTHIS]
          [--zork-dir DIR] [--zork-tmp-dir DIR]
  """
  def main(opts) do
    switches = [command_prefix: :string,
                map_url: :string,
                slack_api_token: :string,
                zork_dir: :string,
                zork_tmp_dir: :string,
                help: :boolean]
    aliases = [cp: :command_prefix,
               mu: :map_url,
               sa: :slack_api_token,
               zd: :zork_dir,
               zt: :zork_tmp_dir,
               h: :help]
    {options, _, _} = OptionParser.parse(opts, switches: switches, aliases: aliases)

    if options[:help] do
      IO.puts "./slork [--command-prefix PREFIX] " <>
              "[--map-url URL] " <>
              "[--slack-api-token TOKEN] " <>
              "[--zork-dir DIR] [--zork-tmp-dir DIR]"
    else
      Slork.start(nil, options)
      receive do
        {:wait_indefinitely} -> nil
      end
    end
  end
end
