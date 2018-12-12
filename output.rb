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

# return an array of lines compounding passed text
# where each line contains as many words as
# possible before max line length is reached
# fitting spaces at the end of a line are
# preserved, but leading
def wrap_lines(text, max_line_length)
  lines = []
    # split text into an alternance of words and whitespaces
  parts = text.split(/(\W+)/)
  current_line = ""
  parts.each do |part|
    if part.strip.empty? then
      # this part is one or more whitespaces
      if current_line.length + part.length <= max_line_length then
        current_line << part
      else
        # whitespace is too big but we don't care to display it at the end of the line, so just skip it and finish the line
        lines << current_line
        # prepare next line (may remain empty if nothing else after that)
        current_line = ""
      end
    else
      # this part is a word
      if current_line.length + part.length <= max_line_length then
        current_line << part
      else
        # if the word is too long but we are at the beginning of the line, it means the wors is longer than
        if current_line.empty? then
          current_line << part[0..max_line_length-1]
        else
          # finish this line now and start new line with current word
          lines << current_line
          current_line = part
        end
      end
    end
  end
  # if current line is not empty, add it as the last one
  unless current_line.empty?
    lines << current_line
  end
  lines

end
