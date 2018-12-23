#!/usr/bin/env ruby

require_relative 'character'
require_relative 'input'
require_relative 'output'

class Game
  @mc = Character.new 'You'
  @pa = Character.new 'Parakeet'

  def self.main
    intro
    outro
  end

  def self.intro
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
    prompt
    @mc.say "..."
    sleep 2
    @pa.say "*squawk* |Of course, you cannot speak! | Not like me."
    @pa.say "Doesn't matter. |I'll teach you the deep arts of gesture-based communication."
    @pa.say "Are you ready?"
    @mc.say "..."
    @pa.say "I'll take that for a 'yes'."
    @pa.say "When you are prompted to answer, you'll see a '>' symbol. |This is where you should enter your gesture action."
    @pa.say "Let's try with a simple one: 'nod'."
    @pa.say "When I prompt you for a reaction, type 'nod' and confirm."
    sleep 2
    loop do
      @pa.say "Are you lost?"
      result = prompt
      if result == :nod then
        break
      end
      @pa.say "No, no, you must enter 'nod' and confirm!"
    end
  end

  def self.outro
    puts "-- END --"
  end

end

Game.main
