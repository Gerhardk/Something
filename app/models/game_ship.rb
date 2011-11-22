class GameShip < ActiveRecord::Base
  belongs_to :ship
  belongs_to :game
end
