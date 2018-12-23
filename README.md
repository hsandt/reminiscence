# Reminiscence

A text adventure to play in the terminal based on communication via gestures.

The game was entirely coded in Ruby on an Android smartphone, using [Termux](https://termux.com) with the ruby package, [CodeBoard Keyboard for Coding by GazLaws](https://play.google.com/store/apps/details?id=com.gazlaws.codeboard) and Vim.

# How to play

To run the game, open a terminal and enter:

`ruby game.rb`

or just:

`./game.rb`

The text output is formatted for a narrow terminal with a width of 51 characters.

## Tested platforms

* Android with Termux

# Unit tests

There are currently only tests for the `output` module.

All unit test scripts are written with `test/unit` and named `tc_{module}.rb`.

You can run unit tests with:

`ruby tc_{module}.rb`
