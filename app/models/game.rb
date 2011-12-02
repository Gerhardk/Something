class Game < ActiveRecord::Base
  has_many :nukes, :dependent => :destroy
  has_many :game_ships, :dependent => :destroy
  has_many :ships, :through => :game_ships
  has_many :blocks, :dependent => :destroy
  validates :email, :presence => true
  validates :name, :presence => true

  attr_accessor :json_string
  after_find do |game|

    game.json_string = ({"name"=>game.name, "email"=>game.email}).to_json

  end

  after_create :create_blocks_for_game


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

 


  def create_blocks_for_game
    ## create player_board

    10.times do |x|
      10.times do |y|
        Block.create(:game_id => self.id, :x => x, :y => y, :server_board => false)
      end
    end

    10.times do |x|
      10.times do |y|
        Block.create(:game_id => self.id, :x => x, :y => y, :server_board => true)
      end
    end
  end

  def send_request_to_server(url)
    uri = URI.parse(url)

    request = Net::HTTP::Post.new(uri.request_uri,  initheader = {'Content-Type' =>'application/json'})
    request.body = self.json_string
    response = Net::HTTP.new(uri.host, uri.port).start {|http| http.request(request) }
    return ActiveSupport::JSON.decode(response.body)
  end

  

end
