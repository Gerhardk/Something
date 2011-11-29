class Nuke < ActiveRecord::Base
  belongs_to :game
  validates :game_id, :presence => true
  validates :x, :presence => true, :numericality => true
  validates :y, :presence => true, :numericality => true

  attr_accessor :json_data
  attr_accessor :response_data
  before_create do |nuke|
    game = nuke.game
    Nuke.where(:game_id => game.id).each do |other_nuke|

      if Integer(other_nuke.x) == Integer(nuke.x) && Integer(other_nuke.y) == Integer(nuke.y)
        self.errors.add(:base, "Can not nuke with x and y that has already been nuked")
      end
    end
  end


  after_create do |nuke|
    game = nuke.game
    nuke.json_data = ({"id"=>Integer(game.server_game_id), "x"=>Integer(nuke.x), "y"=> Integer(nuke.y)}).to_json
    GameShip.where(:game_id =>game.id).each do |game_ship|
      if nuke.server_nuke_boolean
        x_valid = false
        y_valid = false
        game_ship.ship.length.times do |i|

          if game_ship.orientation == "vertical"


            if nuke.x == game_ship.x
              x_valid = true

            end
            if nuke.y == game_ship.y + i
              y_valid = true
            end


            if y_valid && x_valid
              break
            end


          elsif game_ship.orientation == "horizontal"
            if nuke.x == game_ship.x + 1
              x_valid = true

            end
            if nuke.y == game_ship.y
              y_valid = true
            end


            if y_valid && x_valid
              break
            end

          end


        end

        if x_valid && y_valid
          nuke.update_attributes(:status => "hit")
          game_ship.hit_count += 1
          game_ship.save
          game = game_ship.game
          game.server_hits += 1
        else
          nuke.update_attributes(:status => "miss")

        end


      end

    end
  end
  after_find do |nuke|
    game = nuke.game

    nuke.json_data = ({"id"=>Integer(game.server_game_id), "x"=>Integer(nuke.x), "y"=> Integer(nuke.y)}).to_json
  end
end
