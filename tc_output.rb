require_relative "output"
require "test/unit"

class TestOutput < Test::Unit::TestCase

  def test_compute_reading_time
    assert_equal(1, compute_reading_time(20))
  end

  def test_wrap_lines
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
    assert_equal(expected_lines, wrap_lines(text, 10))
  end

end
