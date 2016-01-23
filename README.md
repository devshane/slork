# Slork

Slork is a Slack wrapper around the text adventure Zork. It forwards commands from Slack through the `zork` binary and returns the output.

## Installation

* Clone the repo
* Build zork

```
$ cd zork
$ make
```

* `mix deps.get`
* Set the environment variable `SLORK_SLACK_API_TOKEN` to your Slack API Token
* Start the bot

```
$ ./slork
```

## Usage

Invite your bot to a channel and use the `command_prefix` (defaults to an exclamation mark [**!**]) to direct commands at the bot:

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

   In Dungeon, the intrepid explorer delves into the forgotten secrets
of a lost labyrinth deep in the bowels of the earth, searching for
vast treasures long hidden from prying eyes, treasures guarded by
fearsome monsters and diabolical traps!

   No DECsystem should be without one!

   Dungeon was created at the Programming Technology Division of the MIT
Laboratory for Computer Science by Tim Anderson, Marc Blank, Bruce
Daniels, and Dave Lebling.  It was inspired by the Adventure game of
Crowther and Woods, and the Dungeons and Dragons game of Gygax
and Arneson.  The original version was written in MDL (alias MUDDLE).
The current version was translated from MDL into FORTRAN IV by
a somewhat paranoid DEC engineer who prefers to remain anonymous,
and was later translated to C.

   On-line information may be obtained with the commands HELP and INFO.
```
