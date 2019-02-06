#!/usr/bin/env ruby

# a sandbox that contains the genre of commands
# game.rb use, but just for testing purpose
# useful for highest level functions that don't
# have unit tests

require_relative 'character'
require_relative 'hub'
require_relative 'input'
require_relative 'output'
require_relative 'shards'
require_relative 'data/load_data'

@mc = Character.new 'You'
@him = Character.new 'Him'

Input.create_instance
ShardManager.create_instance

load_data()

tell "You open your eyes and find yourself in a broad room."
tell "Behind you, a bay window lets the dawn - or dusk? - shine through, tainting the room in orange."
tell "The room has no doors. In the middle stands a small withered potted shrub, surrounded by mirror shards spread on the floor."
sleep 1
@him.say "So, you wonder what you are here for, don't you? *gurgle*"
prompt_i
@mc.say "..."
sleep 2
@him.say "*squawk* |Of course, you cannot speak! | Not like me."
@him.say "Doesn't matter. |I'll teach you the deep arts of gesture-based communication."
sleep 2
loop do
@him.say "Are you lost?"
result = prompt_cmd
if result == :nod then
break
end
@him.say "No, no, you must enter 'nod' and confirm!"
tell "You look at the pieces of glass and realize that a few of them do not reflect the room, showing a deep scenery instead."

Hub.display_remaining_shards_until_empty

tell "It looks like there is nothing left to do."
end

puts "-- END --"
