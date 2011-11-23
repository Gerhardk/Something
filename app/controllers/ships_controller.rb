class ShipsController < InheritedResources::Base


  def create
    @ship = Ship.create(params[:ship])
    redirect_to ships_path()

  end

end
