require_relative "output"
require "test/unit"

class TestOutput < Test::Unit::TestCase

  def test_compute_reading_time
    assert_equal(1, compute_reading_time(20))
  end

  def test_wrap_lines_after
    text = "  this  is  a long  text with  looooooooooong words  and a long               blank  "
    expected_lines = [
      "  this  is",
      "a long  ",
      "text with",
      "looooooooo",
      "words  and",
      "a long",
      "blank  "
    ]
    assert_equal([expected_lines, 7], wrap_lines_after(text, 10, 0))
  end

  def test_wrap_lines_after_initial_line_length
    text = "The next line"
    expected_lines = [
      "",  # initial line length will force newline
      "The next line"
    ]
    assert_equal([expected_lines, 13], wrap_lines_after(text, 15, 13))
  end

  def test_wrap_lines_after_special_chars
    text = "Alright?"
    expected_lines = [
      "Alright" # cut instead of sending ? nextline
    ]
    assert_equal([expected_lines, 7], wrap_lines_after(text, 7, 0))
  end

  def test_wrap_lines_after_special_chars2
    text = "don't you know"
    expected_lines = [
      "",  # next line instead of splitting at '
      "don't you ",
      "know"
    ]
    assert_equal([expected_lines, 4], wrap_lines_after(text, 10, 6))
  end

  def test_wrap_lines_after_with_leading_space
    text = "  it's me!"
    expected_lines = [
      "  it's me!"
    ]
    assert_equal([expected_lines, 10], wrap_lines_after(text, 10, 0))
  end

end
