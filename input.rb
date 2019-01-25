def str_to_cmd(str)
  if str == 'nod' then
    return :nod
  end
  nil
end

# prompt for command and return it
def prompt
  print "> "
  input = gets.chomp
  str_to_cmd input
end

# prompt for integer and return it
def prompt_i
  print "> "
  input = gets.chomp
  input.to_i
end
