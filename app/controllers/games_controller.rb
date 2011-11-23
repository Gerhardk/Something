class GamesController < InheritedResources::Base

  def register
    @game = Game.create(params[:game])
    flash[:notice] = "Place your ships"
    redirect_to game_path(@game)
  end

  def nuke

  end
end
