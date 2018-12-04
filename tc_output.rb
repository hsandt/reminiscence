require_relative "output"
require "test/unit"

class TestSimpleOutput < Test::Unit::TestCase

  def test_compute_reading_time
    assert_equal(1, compute_reading_time(20))
  end

end
