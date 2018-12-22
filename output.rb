# estimated reading time per text length unit
# (in s/char)
READING_TIME_FACTOR = 0.05

# default wrap line max length
WRAP_LINE_LENGTH = 51

# narrate text with breaks on |
def tell(text)
  Output.print_split text
end

module Output
  # track the current line length so we know where
  # to wrap when printing after a character name or
  # a sentence
  @current_line_length = 0

  # print text all at once and update current line
  # length. Don't warp (ok for short text like
  # character name)
  def self.print_now(text)
    print text
    @current_line_length += text.length 
  end

  # print text, segment by segment, separated by |,
  # and wait for reading time after each
  def self.print_split(text)
    sentences = text.split '|'
    sentences.each do |s|
      print_for_reading s
    end
    # newline
    puts ''
    @current_line_length = 0
  end

  # print text and wait for reading time
  def self.print_for_reading(text)
    print_wrapped_lines(text, WRAP_LINE_LENGTH)
    sleep(compute_reading_time(text.length))
  end
  
  # print using wrap_lines_after
  def self.print_wrapped_lines(text, max_line_length)
    lines, @current_line_length = wrap_lines_after(text, max_line_length, @current_line_length)
    # we want to add a newline between lines but not at 
    lines = lines.join "\n"
    print lines
    #lines.each { |line| print line }
  end
end

# return estimated reading time in s
def compute_reading_time(text_length)
  text_length * READING_TIME_FACTOR  
end

# return a tuple of:
# an array of lines compounding passed text
#  where each line contains as many words as
#  possible before max line length is reached
# and the new line length
# fitting spaces at the end of a line are
#  preserved, but leading spaces after the first
#  line are not
# initial_current_line_length is used to wrap the
#  first line taking previous text into account
def wrap_lines_after(text, max_line_length, initial_current_line_length)
  lines = []
  # split text into an alternance of words and
  # whitespaces
  parts = text.split(/(\W+)/)
  current_line = ""
  current_line_length = initial_current_line_length
  parts.each do |part|
    #puts("debug part '#{part}' for line length #{current_line_length}")
    if part.strip.empty? then
      # this part is one or more whitespaces
      if current_line_length + part.length <= max_line_length then      
        current_line << part
        current_line_length += part.length
      else      
        # whitespace is too big but we don't care to display it at the end of the line, so just skip it and finish the line
        lines << current_line
        # prepare next line (may remain empty if nothing else after that)
        current_line = ""
        current_line_length = 0
      end
    else
      # this part is a word
      if current_line_length + part.length <= max_line_length then
        current_line << part
        current_line_length += part.length
      else
        # if the word is too long but we are at the beginning of the line, it means the wors is longer than
        # however, for the first line current_line
        # is not reliable as it doesn't contain
        # previously printed text, so use
        # current_line_length
        if current_line_length == 0 then
          current_line << part[0..max_line_length-1]
          current_line_length += max_line_length
        else
          # finish this line now and start new line with current word
          lines << current_line
          current_line = part
          current_line_length = part.length
        end
      end
    end
    #puts("debug line length after part '#{part}': #{current_line_length}")
  end
  # if current line is not empty, add it as the last one
  unless current_line.empty?
    lines << current_line
  end
  # if only 1 partial line was added, the current
  # line length is actually bigger than the length
  # of the last line, so don't rely solely on the
  # lines and return the length separately
  return lines, current_line_length
end
