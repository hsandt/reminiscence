require_relative 'output'

class Character
  
 attr_reader :name

  def initialize(name)
    @name = name
  end

  def say(text)
    Output.print_now "#{name}: "
    Output.print_split text
  end
end


