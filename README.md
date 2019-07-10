# Reminiscence

A text adventure to play in the terminal based on communication via gestures.

The game was entirely coded in Ruby on an Android smartphone, using [Termux](https://termux.com) with the ruby package, [CodeBoard Keyboard for Coding by GazLaws](https://play.google.com/store/apps/details?id=com.gazlaws.codeboard) and Vim.

![Reminiscence v0.1b played in Windows terminal - Run](https://github.com/hsandt/reminiscence/blob/develop/screenshots/v0.1b%20Windows%20-%20Run.png)
![Reminiscence v0.1b played in Windows terminal - Tutorial](https://github.com/hsandt/reminiscence/blob/develop/screenshots/v0.1b%20Windows%20-%20Tutorial.png)

# How to play

## With Ruby

If you have Ruby 2 already installed (and in the path as `ruby`), open a terminal and enter:

`ruby game.rb`

or just:

`./game.rb`

## Without Ruby

We recommend to download the latest [release](https://github.com/hsandt/reminiscence/releases). This is a standalone executable compiled with [ruby-packer](https://github.com/pmq20/ruby-packer) that can be run directly without Ruby. Download the release matching your PC OS, and run it. On Unix, you may need to apply `chmod +x reminiscence` to make it executable.

You can also build the game yourself by using the script:

`./dist_ruby_packer.sh` (UNIX only)
`./dist_all.sh` (all PC platforms)

This will produce an executable `reminiscence` in the `dist` folder, in either `all` or `unix`.

Note that Ruby Ship packs a complete distribution of Ruby, which gives a very big standalone executable (110MB for Linux and OSX each, 40MB for Windows). Therefore, we recommend to play the game with Ruby installed, but we offer the standalone distribution for users who wouldn't have it.

There is no script to make a distribution for Windows only (which would be smaller in size), although I manually made a Windows-only distribution by simply copying only cross-platform and Windows-specific folders from Ruby Ship (used by `dist_all.sh`), so I could make a smaller ZIP archive. It is available in the [Release](https://github.com/hsandt/reminiscence/releases) section on the GitHub repository.

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
