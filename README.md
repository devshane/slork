# Slork

Slork is a Slack wrapper around the text adventure Zork. It forwards commands from Slack through the `zork` binary and returns the output.

## Installation

* Clone this repo
* Build zork: `cd zork; make`
* Set the environment variable `SLORK_SLACK_API_TOKEN` to your Slack API Token
* Get dependencies: `mix deps.get`
* Build the bot: `mix escript.build`
* Start the bot: `./slork`

## Usage

In addition to the configuration at `config/config.ex`, the bot supports a few command-line switches:

```
./slork [--command-prefix PREFIX]
        [--map-url URL]
        [--slack-api-token DONTDOTHIS]
        [--zork-dir DIR] 
        [--zork-tmp-dir DIR]
```

Once running, invite your bot to a channel and use the `command_prefix` (defaults to an exclamation mark [**!**]) to direct commands at the bot:

```
> !look

You are in an open field west of a big white house with a boarded 
front door.
There is a small mailbox here.

> !open mailbox

Opening the mailbox reveals:
  A leaflet.

> !read leaflet

Taken.
      Welcome to Dungeon!

   Dungeon is a game of adventure, danger, and low cunning.  In it
you will explore some of the most amazing territory ever seen by mortal
man.  Hardened adventurers have run screaming from the terrors contained
within.
```
