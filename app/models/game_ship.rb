class GameShip < ActiveRecord::Base
  belongs_to :ship
  belongs_to :game
  has_many :blocks, :dependent => :destroy
  before_create :check_for_max_ships

  validates :game_id, :presence => true
  validates :ship_id, :presence => true

  after_update :check_if_ship_is_sunk

  def check_for_max_ships
    ship = Ship.find(self.ship_id)

    if GameShip.where(:ship_id => ship.id, :game_id => self.game_id).count >= ship.max_per_game
      game = Game.find(self.game_id)
      game.errors.add(:base, "Max Number of ships per game reached")
      return false
    end
  end

  def check_if_ship_is_sunk
    if self.sunk == false
      if self.hit_count == self.ship.length
        self.update_attributes(:sunk => true)

      end
    end
  end



end
