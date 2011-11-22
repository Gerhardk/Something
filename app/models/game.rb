class Game < ActiveRecord::Base
  has_many :nukes
  has_many :game_ships
  has_many :ships, :through => :game_ships

  validates :email, :presence => true
  validates :name, :presence => true

  include Stateflow
  stateflow do
    state_column :status
    initial :in_progress
    state :in_progress,:won, :lost

    event :win_game do
      transitions :from => :in_progress, :to => :won
    end

    event :lose_game do
      transitions :from => :in_progress, :to => :lost
    end

  end


end
