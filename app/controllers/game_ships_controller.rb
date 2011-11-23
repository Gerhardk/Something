class GameShipsController < InheritedResources::Base
  respond_to :js, :html, :xml
  def create
    @game = Game.find(params[:game_ship][:game_id])

    @game_ship = GameShip.create(params[:game_ship])
    if @game_ship.id != nil
      render :nothing => true
    else
      render :template => "game_ships/errors.js.erb"
    end
  end
end
