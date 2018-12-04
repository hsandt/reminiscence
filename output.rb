# estimated reading time per text length unit
# (in s/char)
READING_TIME_FACTOR = 0.05

# narrate text with breaks on |
def tell(text)
  print_split text
end

# print text, segment by segment, separated by |,
# and wait for reading time after each
def print_split(text)
  sentences = text.split '|'
  sentences.each do |s|
    print_for_reading s
  end
  # newline
  puts ''
end

# print text and wait for reading time
def print_for_reading(text)
  print text
  sleep(compute_reading_time(text.length))
end

# return estimated reading time in s
def compute_reading_time(text_length)
  text_length * READING_TIME_FACTOR  
end
