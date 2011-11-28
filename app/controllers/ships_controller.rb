class ShipsController < InheritedResources::Base


  def create

    if @ship = Ship.create(params[:ship])
      redirect_to ships_path()
    else
      redirect_to new_ship
    end
  end

end
