require_relative '../shards'
require_relative '../output'

def load_shard01
  shard_description01 = "A beautiful scenery"

  recall_memory01 = Proc.new do |state|
    tell "Recalling memory 01..."
    state.completed = true
  end

  shard_data01 = ShardData.new(1, shard_description01, recall_memory01)
  shard01 = Shard.new shard_data01
  shard01.unlock
  ShardManager.get.register(shard01)
end
