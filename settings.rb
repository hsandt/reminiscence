class Settings

  @@instance = nil

  def self.create_instance
    raise "Input singleton instance already exists" unless @@instance.nil?
    @@instance = new
  end

  # for unit test teardown only
  def self.clear_instance
    @@instance = nil
  end

  def self.get
    @@instance
  end

  # estimated reading time per text length unit
  # (in s/char)
  attr_accessor :reading_time_factor

  # default wrap line max length
  attr_accessor :wrap_line_length

  private
  def initialize
  end
 
end

