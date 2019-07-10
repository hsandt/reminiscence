#!/usr/bin/env bash

# Build game in dist/reminiscence for all PC platforms with Ruby Ship
# The distribution is cross-platform, but this script must be run from Unix

# Dependency: Ruby Ship (a copy of the ruby_ship repository must be installed)

# Arguments: pass the path to ruby_ship repository copy as 1st argument $1
# If no arguments are passed, only the game source will be copied. This is useful
# when you have already copied Ruby Ship and only need to update the game.

# Bundle the game with a copy of Ruby thanks to the Ruby Ship default (Ruby 2.2)
mkdir -p dist/all
# Copy the distribution of Ruby if indicated
if [[ ! -z "$1" ]]; then
	cp -r "$1" dist/all/ruby_ship
fi
# No trailing slash on "src" to copy the actual folder, not its content
cp -r src dist/all
# Trailing slash on "scripts" to copy the scripts directly into the destination folder
cp -r scripts/ dist/all
