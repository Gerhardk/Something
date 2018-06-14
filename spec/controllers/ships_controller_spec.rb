require 'rails_helper'
describe ShipsController do
  def valid_attributes
    {:name => "Battleship", :length => 4, :max_per_game => 1}
  end

  describe "GET index" do
    it "assigns all ships as @ships" do
      ship = Ship.create! valid_attributes
      get :index
      assigns(:ships).should eq([ship])
    end
  end

  describe "GET show" do
    it "assigns the requested ship as @ship" do
      ship = Ship.create! valid_attributes
      get :show, :id => ship.id
      assigns(:ship).should eq(ship)
    end
  end

  describe "GET new" do
    it "assigns a new ship as @ship" do
      get :new
      assigns(:ship).should be_a_new(Ship)
    end
  end

  describe "GET edit" do
    it "assigns the requested ship as @ship" do
      ship = Ship.create! valid_attributes
      get :edit, :id => ship.id
      assigns(:ship).should eq(ship)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ship" do
        expect {
          post :create, :ship => valid_attributes
        }.to change(Ship, :count).by(1)
      end

      it "assigns a newly created ship as @ship" do
        post :create, :ship => valid_attributes
        assigns(:ship).should be_a(Ship)
        assigns(:ship).should be_persisted
      end

      it "redirects to the created ship" do
        post :create, :ship => valid_attributes
        response.should redirect_to(ships_path())
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ship as @ship" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ship.any_instance.stub(:save).and_return(false)
        post :create, :ship => {}
        assigns(:ship).should be_a_new(Ship)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ship.any_instance.stub(:save).and_return(false)
        post :create, :ship => {}
        response.should redirect_to(new_ship_path())
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ship" do
        ship = Ship.create! valid_attributes
        # Assuming there are no other ships in the database, this
        # specifies that the Ship created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Ship.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => ship.id, :ship => {'these' => 'params'}
      end

      it "assigns the requested ship as @ship" do
        ship = Ship.create! valid_attributes
        put :update, :id => ship.id, :ship => valid_attributes
        assigns(:ship).should eq(ship)
      end

      it "redirects to the ship" do
        ship = Ship.create! valid_attributes
        put :update, :id => ship.id, :ship => valid_attributes
        response.should redirect_to(ship)
      end
    end

    describe "with invalid params" do
      it "assigns the ship as @ship" do
        ship = Ship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Ship.any_instance.stub(:save).and_return(false)
        put :update, :id => ship.id, :ship => {}
        assigns(:ship).should eq(ship)
      end

      it "re-renders the 'edit' template" do
        ship = Ship.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Ship.any_instance.stub(:save).and_return(false)
        put :update, :id => ship.id, :ship => {}
        response.should redirect_to(edit_ship_path(ship))
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ship" do
      ship = Ship.create! valid_attributes
      expect {
        delete :destroy, :id => ship.id
      }.to change(Ship, :count).by(-1)
    end

    it "redirects to the ships list" do
      ship = Ship.create! valid_attributes
      delete :destroy, :id => ship.id
      response.should redirect_to(ships_url)
    end
  end

end
