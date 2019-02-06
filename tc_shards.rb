require_relative "shards"
require "test/unit"

class TestShards < Test::Unit::TestCase

  def setup
    ShardManager.create_instance
    @data1 = ShardData.new(1, "data1", Proc.new || {})
  end

  def teardown
    ShardManager.clear_instance
  end

  def test_get_remaining_shards_0_unlocked
    shard1 = Shard.new @data1
    ShardManager.get.register shard1
    assert_equal([], ShardManager.get.get_remaining_shards)
  end

  def test_get_remaining_shards_1_unlocked
    shard1 = Shard.new @data1
    shard1.unlock
    ShardManager.get.register shard1
    assert_equal([shard1], ShardManager.get.get_remaining_shards)
  end
  
end
