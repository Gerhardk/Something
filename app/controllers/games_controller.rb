class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = find_game

    flash[:notice] = "Place your ships"
    @game_ships = GameShip.where(:game_id => @game.id)
    render :show
  end

  def register
    @game = Game.find(params[:id])
    @json_string = @game.json_string


    response = @game.send_request_to_server("http://battle.platform45.com/register")
   
    server_game_id = response

    if server_game_id.has_key? "id"
      @game.update_attributes(:server_game_id =>Integer(server_game_id["id"]))
      redirect_to battle_game_path(@game)
    end

  end

  def battle
    @game =Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.create(game_params)
    if @game.valid?
      redirect_to @game
    else
      render :new
    end
  end

  def nuke
  end

  def edit
    @game = find_game
  end

  def update
    @game = find_game
    if @game.update_attributes(params[:game])

      redirect_to games_path
    else
      render :edit
    end
  end

  private

  def find_game
    Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:email, :name)
  end
end
