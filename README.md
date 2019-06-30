# Reminiscence

A text adventure to play in the terminal based on communication via gestures.

The game was entirely coded in Ruby on an Android smartphone, using [Termux](https://termux.com) with the ruby package, [CodeBoard Keyboard for Coding by GazLaws](https://play.google.com/store/apps/details?id=com.gazlaws.codeboard) and Vim.

# How to play

## With Ruby

If you have ruby already installed, open a terminal and enter:

`ruby game.rb`

or just:

`./game.rb`

## Without Ruby

We recommend to download the latest [release](https://github.com/hsandt/reminiscence/releases). This is a standalone executable compiled with [ruby-packer](https://github.com/pmq20/ruby-packer) that can be run directly without Ruby. Download the release matching your PC OS and run it. (TODO: support Windows)

You can also build the game yourself by using the script:

`./dist.sh`

This will produce an executable `reminiscence` in the `dist` folder.

## Notes

The text output is formatted for a narrow terminal with a width of 51 characters.

## Tested platforms

* Android with Termux (play with Ruby only)
* Linux Ubuntu (play with Ruby and `dist.sh`)

# Unit tests

There are currently only tests for the `output` module.

All unit test scripts are written with `test/unit` and named `tc_{module}.rb`.

You can run unit tests with:

`ruby tc_{module}.rb`
