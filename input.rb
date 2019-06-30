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
  
  def self.str_to_cmd(str)
    if str == 'nod' then
      return :nod
    end
    nil
  end

  public
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
        print "[Invalid integer]"
      end
    end
  end
end

# shortcut functions

def prompt_cmd
  fail "Input singleton instance not created" if Input.get.nil? 
  Input.get.prompt_cmd
end

def prompt_i(lower, upper)
  fail "Input singleton instance not created" if Input.get.nil? 
  Input.get.prompt_i(lower, upper)
end

