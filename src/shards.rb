class ShardData

  attr_reader :id
  attr_reader :description

  def initialize(id, description, memory_proc)
    @id = id
    @description = description
    @memory_proc = memory_proc
  end
    
end

class ShardState

  attr_accessor :unlocked
  attr_accessor :completed

  def initialize
    @unlocked = false
    @completed = false
  end

end

class Shard

  attr_reader :data
  attr_reader :state

  def initialize(data)
    @data = data
    @state = ShardState.new
  end

  def unlock
    @state.unlocked = true
  end

  def complete
    @state.completed = true
  end

  def start
    @data.memory_proc_call @state
  end
    
end

class ShardManager

  @@instance = nil

  def self.create_instance
    raise "ShardManager singleton instance already exists" unless @@instance.nil?
    @@instance = new
  end

  # for unit test teardown only
  def self.clear_instance
    @@instance = nil
  end

  def self.get
    @@instance
  end

  private
  def initialize
    @shard_dict = {}
  end

  public
  def register(shard)
    @shard_dict[shard.data.id] = shard
  end

  def get_remaining_shards
    @shard_dict.values.select { |shard| shard.state.unlocked and not shard.state.completed }
  end

end
