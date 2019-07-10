#!/usr/bin/env bash

# Build game in dist/reminiscence for Linux with Ruby Packer (tested on Ubuntu only)

# Dependency: ruby-packer (https://github.com/pmq20/ruby-packer) with `rubyc` in PATH

# Fix ncurses error (https://github.com/pmq20/ruby-packer/issues/14)
export CPPFLAGS="-P"

# Compile with ruby-packer as `reminiscence`
# Provide temp directory to avoid security flaw (https://github.com/pmq20/ruby-packer/issues/66)
mkdir -p dist/unix
rubyc -r . -d ~/tmp/reminiscence build game.rb -o dist/unix/reminiscence
