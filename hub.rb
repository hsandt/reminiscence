require_relative 'input'
require_relative 'output'
require_relative 'shards'

module Hub

  def self.display_remaining_shards_until_empty
    loop do 
      remaining_shards = ShardManager.get.get_remaining_shards
      unless remaining_shards.empty? then
        display_shard_choices remaining_shards
      else
        tell "There are no shards you haven't completed"
        break
      end
    end
  end

  def self.display_shard_choices(remaining_shards)
    tell "You see the following:"
    remaining_shards.each_with_index do |shard, i|
      tell "#{i}. #{shard.data.description}"
    end
    shard_natural_index = nil
    loop do
      tell "Which one do you look into?"
      shard_natural_index = prompt_i(1, remaining_shards.length)
      if shard_natural_index >= 1 and shard_natural_index <= remaining_shards.length then
        break
      end
      tell "Invalid number"
    end
    # convert from natural to 0-based index
    selected_shard = remaining_shards[shard_natural_index - 1]
    tell "You enter memory: #{selected_shard.data.description}"
    selected_shard.complete
  end

end
