class Ship < ActiveRecord::Base
  has_many :game_ships
  has_many :games, :through => :game_ships

  validates :name, :presence => true
  validates :length, :presence => true, :numericality => true
  validates :max_per_game, :presence => true, :numericality => true


end
