class Character
  
 attr_reader :name

  def initialize(name)
    @name = name
  end

  def say(text)
    puts "#{name}: #{text}"
  end
end


