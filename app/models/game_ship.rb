class GameShip < ActiveRecord::Base
  belongs_to :ship
  belongs_to :game
  has_many :blocks
  before_create :check_for_max_ships

  validates :game_id, :presence => true
  validates :ship_id, :presence => true

  after_create :update_blocks
  after_update :check_if_ship_is_sunk
  before_destroy :check_blocks

  def check_blocks
    Block.where(:game_id => self.game_id, :server_board => false).each do |block|
      self.ship.length.times do |i|
        if self.orientation == "horizontal"

              if block.y == self.y


                if (block.x + i) == (self.x + i)
                  block.update_attributes(:game_ship_id => nil)
                  if i != 0
                    if next_block =Block.where(:game_id => self.game_id, :server_board => false, :x => block.x + i, :y => block.y).last

                      next_block.update_attributes(:game_ship_id => nil)
                    end
                  end
                end
              end
            elsif self.orientation == "vertical"
              if block.x == self.x
                if (block.y + i) == (self.y + i)

                  block.update_attributes(:game_ship_id => nil)
                  if i != 0
                    if next_block =Block.where(:game_id => self.game_id, :server_board => false, :x => block.x, :y => block.y + i).last

                      next_block.update_attributes(:game_ship_id => nil)
                    end
                  end
                end
              end
            end
          end

        end
  end

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

  def update_blocks
    Block.where(:game_id => self.game_id, :server_board => false).each do |block|
      self.ship.length.times do |i|
        if self.orientation == "horizontal"

          if block.y == self.y


            if (block.x + i) == (self.x + i)
              block.update_attributes(:game_ship_id => self.id)
              if i != 0
                if next_block =Block.where(:game_id => self.game_id, :server_board => false, :x => block.x + i, :y => block.y).last

                  next_block.update_attributes(:game_ship_id => self.id)
                end
              end
            end
          end
        elsif self.orientation == "vertical"
          if block.x == self.x
            if (block.y + i) == (self.y + i)

              block.update_attributes(:game_ship_id => self.id)
              if i != 0
                if next_block =Block.where(:game_id => self.game_id, :server_board => false, :x => block.x, :y => block.y + i).last

                  next_block.update_attributes(:game_ship_id => self.id)
                end
              end
            end
          end
        end
      end

    end

  end

end
