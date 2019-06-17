require_relative "hub"
require_relative "input"
require_relative "settings"
require "test/unit"

class TestHub < Test::Unit::TestCase

  def setup
    Settings.create_instance

    Settings.get.reading_time_factor = 0.05
    Settings.get.wrap_line_length = 50

    @input = StringIO.new
    Input.create_instance @input
 
    ShardManager.create_instance
    @data1 = ShardData.new(1, "data1", Proc.new || {})
  end

  def teardown
    Settings.clear_instance
    Input.clear_instance
    ShardManager.clear_instance
  end

  def test_display_remaining_shards_until_empty_0_unlocked
    shard1 = Shard.new @data1
    ShardManager.get.register shard1
    # simple no exception test
    # ! output functions are not mocked
    # so this will output text and even prompt!
    Hub.display_remaining_shards_until_empty
  end

  def test_display_remaining_shards_until_empty_1_unlocked
    shard1 = Shard.new @data1
    shard1.unlock
    ShardManager.get.register shard1

    @input.puts 1
    @input.rewind

    # simple no exception test
    # ! output functions are not mocked
    # so this will output text and even prompt!
       Hub.display_remaining_shards_until_empty
  end
 
  def test_display_shard_choices_1_unlocked
    shard1 = Shard.new @data1
    shard1.unlock
    shards = [shard1]

    @input.puts 1
    @input.rewind

    # simple no exception test
    # ! output functions are not mocked
    # so this will output text and even prompt!
    Hub.display_shard_choices shards
  end
  
end
