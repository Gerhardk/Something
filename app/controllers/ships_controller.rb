class ShipsController < InheritedResources::Base


  def create
    @ship = Ship.create(params[:ship])
    if @ship.id != nil
      redirect_to ships_path()
    else
      redirect_to new_ship_path()
    end
  end

  def update
    @ship = Ship.find(params[:id])
    if @ship.update_attributes(params[:ship])
      redirect_to ship_path(@ship )
    else
      redirect_to edit_ship_path(@ship )
    end
  end

end
