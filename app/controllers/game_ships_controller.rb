class GameShipsController < InheritedResources::Base
  respond_to :js, :html, :xml
  def create
    @game = Game.find(params[:game_ship][:game_id])
    @game_ship = GameShip.create(params[:game_ship])
    if @game_ship.id != nil 
      render :register
    else
      render :template => "game_ships/errors.js.erb"
    end
  end

  def destroy
    @game_ship = GameShip.find(params[:id])
    @game = @game_ship.game
    if @game_ship.destroy
      render :register
     end
  end

  def edit
    @game_ship = GameShip.find(params[:id])
    @game = @game_ship.game
    render :edit
  end

  def update
    @game_ship = GameShip.find(params[:id])
    @game = @game_ship.game
    if @game_ship.update_attributes(params[:game_ship])
      render :register
    else
      render :edit
    end
  end
end
