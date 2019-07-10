class Input

  @@instance = nil

  def self.create_instance(input = $stdin)
    raise "Input singleton instance already exists" unless @@instance.nil?
    @@instance = new input
  end

  # for unit test teardown only
  def self.clear_instance
    @@instance = nil
  end

  def self.get
    @@instance
  end

  private
  # use stdin by default for game
  # but allow custom input stream for testing
  # https://stackoverflow.com/questions/12478133/write-test-for-accepting-input-from-command-line
  def initialize(input)
    @input = input
  end

  def self.str_to_bool(str)
    if %w(true yes y).include?(str.downcase) then
      return true
    elsif %w(false no n).include?(str.downcase) then
      return false
    else
      return nil
    end
  end
  
  def self.str_to_cmd(str)
    if str == 'nod' then
      return :nod
    end
    nil
  end

  public
  # prompt for a yes/no answer until input is valid
  def prompt_b
    loop do
      print "[(yes/no)]"
      print "> "
      input_str = @input.gets
      if input_str.nil?
        raise "No input left (must be automated input)"
      end
      input_str = input_str.chomp
      input_bool = Input.str_to_bool input_str
      unless input_bool.nil?
        return input_bool
      else
        print "[Please enter yes/no, y/n or true/false]"
      end
    end
  end

  # prompt for command and return it
  def prompt_cmd
    print "> "
    input_str = @input.gets.chomp
    Input.str_to_cmd input_str
  end

  # prompt for integer and return it
  def prompt_i(lower, upper)
    loop do
      print "[Enter an integer in the range #{lower}-#{upper}]"
      print "> "
      input_str = @input.gets
      if input_str.nil?
        raise "No input left (must be automated input)"
      end
      input_str = input_str.chomp
      input_int = input_str.to_i
      if input_int.between?(lower, upper)
        return input_int
      else
        print "[Invalid integer range]"
      end
    end
  end
end

# shortcut functions

def prompt_b
  fail "Input singleton instance not created" if Input.get.nil? 
  Input.get.prompt_b
end


def prompt_cmd
  fail "Input singleton instance not created" if Input.get.nil? 
  Input.get.prompt_cmd
end

def prompt_i(lower, upper)
  fail "Input singleton instance not created" if Input.get.nil? 
  Input.get.prompt_i(lower, upper)
end

