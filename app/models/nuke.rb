class Nuke < ActiveRecord::Base
  belongs_to :game
  validates :game_id, :presence => true
  validates :x, :presence => true, :numericality => true
  validates :y, :presence => true, :numericality => true

  attr_accessor :json_data
  attr_accessor :response_data

  after_create :check_blocks

  def check_blocks

    self.json_data = ({"id"=>Integer(self.game.server_game_id), "x"=>Integer(self.x), "y"=> Integer(self.y)}).to_json
    if self.server_nuke_boolean?
      if block = Block.where(:x => self.x, :y => self.y, :server_board => false).last

        if block.game_ship


          if block.state == "in_play"
            game_ship = GameShip.find(block.game_ship_id)
            
            game_ship.hit_count += 1
            game_ship.check_if_ship_is_sunk
            

          end
          block.hit_block!


          self.update_attributes(:status => "hit")
        else

          block.miss_block!
          self.update_attributes(:status => "miss")
        end
      end
    else
      if block = Block.where(:x => self.x, :y => self.y, :server_board => true).last
        if self.status == "hit"
          if block.state == "in_play"


          end
          block.hit_block!
        else

          block.miss_block!
        end

      end
    end
  end


  after_find do |nuke|
    game = nuke.game

    nuke.json_data = ({"id"=>Integer(game.server_game_id), "x"=>Integer(nuke.x), "y"=> Integer(nuke.y)}).to_json
  end

  def send_nuke_to_server(url)
    p self.json_data
    uri = URI.parse(url)

      request = Net::HTTP::Post.new(uri.request_uri,  initheader = {'Content-Type' =>'application/json'})
      request.body = self.json_data
      response = Net::HTTP.new(uri.host, uri.port).start {|http| http.request(request) }

      return data = ActiveSupport::JSON.decode(response.body)
  end
end
