def str_to_cmd(str)
  if str == 'nod' then
    return :nod
  end
  nil
end

def prompt
  input = gets.chomp
  str_to_cmd input
end

