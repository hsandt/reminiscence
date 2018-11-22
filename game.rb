require_relative 'character'
require_relative 'input'

def main
  mc = Character.new 'You'
  pa = Character.new 'Parrot'
  puts "Old man: Hello, #{mc.name}!"
  puts "  Where do you come from? >>"
  gets
  puts "#{mc.name}: ..."
  puts "Old man: Oh, I see you cannot speak."
  puts "  Fear not, as I will teach you the basics of communication."
  puts "  To acquiese, simply 'nod' when prompted to answer."
  puts "  You will always be prompted with the symbols '>>'."
  loop do
    puts "Can you 'nod' now? >>"
    result = prompt
    if result == :nod then
      puts "Good."
      break
    end
    puts "No, no, you must enter 'nod' and confirm!"

  end
end

main
