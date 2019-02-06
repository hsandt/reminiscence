require_relative "hub"
require "test/unit"

class TestHub < Test::Unit::TestCase

  def setup
    ShardManager.create_instance
    @data1 = ShardData.new(1, "data1", Proc.new || {})
  end

  def teardown
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
    # simple no exception test
    # ! output functions are not mocked
    # so this will output text and even prompt!
    Hub.display_remaining_shards_until_empty
  end
 
  def test_display_shard_choices_1_unlocked
    shard1 = Shard.new @data1
    shard1.unlock
    shards = [shard1]
    # simple no exception test
    # ! output functions are not mocked
    # so this will output text and even prompt!
    Hub.display_shard_choices shards
  end
  
end
