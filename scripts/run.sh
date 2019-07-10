#!/usr/bin
# This should be run along a distribution of Ruby Ship
# Run dist.sh from the project root to create a copy of Ruby Ship and the game source
script_path="$(dirname "$0")"
"$script_path/ruby_ship/bin/ruby_ship.sh" "$script_path/src/game.rb"
