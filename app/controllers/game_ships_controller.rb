class GameShipsController < InheritedResources::Base

  def create
    @game_ship = GameShip.create(params[:game_ship])
    render :nothing => true
  end
end
