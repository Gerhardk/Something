class GamesController < InheritedResources::Base

  def register
    @game = Game.find(params[:id])
    flash[:notice] = "Place your ships"
    @game_ships = GameShip.where(:game_id => @game.id)
    render :register
  end

  def create
    @game = Game.create(params[:game])
    if @game.valid?
      redirect_to register_game_path(@game)
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
