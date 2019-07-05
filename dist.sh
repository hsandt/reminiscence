#!/bin/bash

# Build game in dist/reminiscence for Linux (tested on Ubuntu only)

# Dependency; ruby-packer (https://github.com/pmq20/ruby-packer) with `rubyc` in PATH

# Fix ncurses error (https://github.com/pmq20/ruby-packer/issues/14)
export CPPFLAGS="-P"

# Compile with ruby-packer
# Provide temp directory to avoid security flaw (https://github.com/pmq20/ruby-packer/issues/66)
mkdir -p dist
rubyc -r . -d ~/tmp/reminiscence build game.rb -o dist/reminiscence
