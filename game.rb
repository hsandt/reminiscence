#!/usr/bin/env ruby

require_relative 'character'
require_relative 'hub'
require_relative 'input'
require_relative 'output'
require_relative 'settings'
require_relative 'shards'
require_relative 'data/load_data'

class Game
  VERSION = 0.1  

  @mc = Character.new 'You'
  @pa = Character.new 'Parakeet'

  def self.initialize_singletons
    Input.create_instance
    Settings.create_instance
    Settings.get.reading_time_factor = 0.05
    Settings.get.wrap_line_length = 50
    ShardManager.create_instance
  end

  def self.main
    initialize_singletons()
    load_data()

    # debug
#    display_remaining_shards_until_empty

    intro
    outro
  end

  def self.intro
    tell "= Reminiscence ="
    tell "v#{VERSION}                "
    tell ""
    tell "You open your eyes and find yourself in a broad room."
    tell "Behind you, a bay window lets the dawn - or dusk? - shine through, tainting the room in orange."
    tell "The room has no doors. In the middle stands a small withered potted shrub, surrounded by mirror shards spread on the floor."
    tell "Suddenly, a parakeet appears in the air and lands on the shrub."
    @pa.say "Welcome to the room of regrets."
    sleep 0.5
    tell "The parakeet makes a break, then giggles with a high-pitched voice."
    @pa.say "I've always wanted to say that."
    sleep 1
    @pa.say "So, you wonder what you are here for, don't you? *gurgle*"
    @pa.say "Well, do you see those mirror shards?"
    prompt_cmd
    @mc.say "..."
    sleep 2
    @pa.say "*squawk* |Of course, you cannot speak! | Not like me."
    @pa.say "Doesn't matter. |I'll teach you the deep arts of gesture-based communication."
    @pa.say "Are you ready?"
    @mc.say "..."
    sleep 1
    @pa.say "I'll take that for a 'yes'."
    @pa.say "When you are prompted to answer, you'll see a '>' symbol. |This is where you should enter your gesture action."
    @pa.say "Let's try with a simple one: 'nod'."
    @pa.say "When I prompt you for a reaction, type 'nod' and confirm."
    sleep 2
    loop do
      @pa.say "Are you lost?"
      result = prompt_cmd
      if result == :nod then
        break
      end
      @pa.say "No, no, you must enter 'nod' and confirm!"
    end
    @pa.say "Perfect.| Now you can share your despair with everyone else."
    @pa.say "All right, time to go now.| Have a look into one of the mirror shards.| You'll guess what to do from then on. Is it all clear?"
    
    result = prompt_cmd
    if result == :nod then
      @pa.say "Of course it is. I have a teaching license in communication."
    else
      @pa.say "Hm, it looks like you cannot convey all your thoughts. Don't worry, that will come in time."
    end
    
    @pa.say "So, which shard will you look into?"
    
    tell "You look at the pieces of glass and realize that a few of them do not reflect the room, showing a deep scenery instead."

    Hub.display_remaining_shards_until_empty

    tell "It looks like there is nothing left to do."
  end

  def self.outro
    puts "-- END --"
  end

end

Game.main
