require 'net/http'

require 'rubygems'
require 'json'

class GamesController < InheritedResources::Base

  def show
    @game = Game.find(params[:id])

    flash[:notice] = "Place your ships"
    @game_ships = GameShip.where(:game_id => @game.id)
    render :show
  end

  def register
    @game = Game.find(params[:id])
    @json_string = @game.json_string

    uri = URI.parse("http://battle.platform45.com/register")

    request = Net::HTTP::Post.new(uri.request_uri,  initheader = {'Content-Type' =>'application/json'})
    request.body = @json_string
    response = Net::HTTP.new(uri.host, uri.port).start {|http| http.request(request) }
    server_game_id = ActiveSupport::JSON.decode(response.body)
    if server_game_id.has_key? "id"
      @game.update_attributes(:server_game_id =>Integer(server_game_id["id"]))
      redirect_to battle_game_path(@game)
    end

  end

  def battle
    @game =Game.find(params[:id])
  end

  def create
    @game = Game.create(params[:game])
    if @game.valid?

      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def nuke

  end

  def update
    @game = Game.find(params[:id])
    if @game.update_attributes(params[:game])

      redirect_to games_path
    else
      render :edit
    end

  end


end
