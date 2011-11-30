class Block < ActiveRecord::Base
  belongs_to :game
  belongs_to :game_ship

  validates :game_id, :presence => true

  include Stateflow
    stateflow do
      state_column :state
      initial :noe
      state :none, :hit, :miss

      event :hit_block do
        transitions :from => :none, :to => :hit
      end

      event :miss_block do
        transitions :from => :none, :to => :miss
      end

    end
end
