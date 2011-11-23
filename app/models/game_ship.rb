class GameShip < ActiveRecord::Base
  belongs_to :ship
  belongs_to :game

  before_create :check_for_max_ships

  def check_for_max_ships
    ship = Ship.find(self.ship_id)

    if GameShip.where(:ship_id => ship.id).count >= ship.max_per_game
      self.errors.add(:base, "Max Number of ships per game reached")
      return false
    end
  end

end
