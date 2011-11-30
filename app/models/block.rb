class Block < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_ship

  validates :game_id, :presence => true

  include Stateflow
  stateflow do
      state_column :state
      initial :in_play
      state :in_play, :hit, :miss

      event :hit_block do
        transitions :from => :in_play, :to => :hit
        transitions :from => :hit, :to => :hit
      end

      event :miss_block do
        transitions :from => :in_play, :to => :miss
        transitions :from => :miss, :to => :miss
      end

  end

end
