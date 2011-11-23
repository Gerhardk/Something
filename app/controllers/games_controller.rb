class GamesController < InheritedResources::Base

  def register
    @game = Game.create(params[:game])
    flash[:notice] = "Place your ships"
    @game_ships = GameShip.where(:game_id => @game.id)
    render :register
  end

  def nuke

  end
end
