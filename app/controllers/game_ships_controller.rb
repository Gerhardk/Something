class GameShipsController < ApplicationController
  def index
    @game_ships = GameShip.all
  end

  def show
    @game_ship = GameShip.find(params[:id])
  end

  def new
    @game_ship = GameShip.new
  end

  def create
    @game = Game.find(params[:game_ship][:game_id])
    @game_ship = GameShip.create(game_ship_params)
    if @game_ship.valid? 
      render :register
    else
      render :template => "game_ships/errors.js.erb"
    end
  end

  def destroy
    @game_ship = find_game_ship
    @game = @game_ship.game
    if @game_ship.destroy
      render :register
    end
  end

  def edit
    @game_ship = find_game_ship
    @game = @game_ship.game
    render :edit
  end

  def update
    @game_ship = find_game_ship
    @game = @game_ship.game
    if @game_ship.update(game_ship_params)
      render :register
    else
      render :edit
    end
  end

  private

  def find_game_ship
    GameShip.find(params[:id])
  end

  def game_ship_params
    params.require(:game_ship).permit(:game_id, :ship_id, :hit_count, :orientation, :sunk, :x, :y)
  end
end
