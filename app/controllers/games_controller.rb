class GamesController < InheritedResources::Base

  def register
    @game = Game.find(params[:id])
    flash[:notice] = "Place your ships"
    @game_ships = GameShip.where(:game_id => @game.id)
    render :register
  end

  def create
    @game = Game.create(params[:game])
    redirect_to register_game_path(@game)
  end

  def nuke

  end
end
