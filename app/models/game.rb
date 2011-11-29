class Game < ActiveRecord::Base
  has_many :nukes, :dependent => :destroy
  has_many :game_ships, :dependent => :destroy
  has_many :ships, :through => :game_ships

  validates :email, :presence => true
  validates :name, :presence => true

  attr_accessor :json_string
  after_find do |game|

    game.json_string = ({"name"=>game.name, "email"=>game.email}).to_json

  end

  after_update :check_server_hits, :check_client_hits

  include Stateflow
  stateflow do
    state_column :status
    initial :in_progress
    state :in_progress, :won, :lost

    event :win_game do
      transitions :from => :in_progress, :to => :won
    end

    event :lose_game do
      transitions :from => :in_progress, :to => :lost
    end

  end

  def check_server_hits
    if self.server_hits == 18
      self.lose_game!
    end
  end

  def check_client_hits
    if self.client_hits == 18
      self.win_game!
    end
  end

end
