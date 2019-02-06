require_relative "input"
require "test/unit"

class TestInput < Test::Unit::TestCase

  def setup
    @input = StringIO.new
    Input.create_instance @input
  end

  def teardown
    Input.clear_instance
  end

  def test_prompt_i_integer
    @input.puts "5"
    @input.rewind
    assert_equal(5, prompt_i)
  end

  def test_prompt_i_negative
    @input.puts "-10"
    @input.rewind
    assert_equal(-10, prompt_i)
  end

  def test_prompt_i_float
    @input.puts "2.4"
    @input.rewind
    assert_equal(2, prompt_i)
  end

  def test_prompt_i_surrounding_spaces
    @input.puts "   65   "
    @input.rewind
    assert_equal(65, prompt_i)
  end

  def test_prompt_i_number_start
    @input.puts "7more"
    @input.rewind
    assert_equal(7, prompt_i)
  end
  def test_prompt_i_invalid
    @input.puts "word"
    @input.rewind
    assert_equal(0, prompt_i)
  end

end

