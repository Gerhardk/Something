require 'rails_helper'
describe GameShipsController do

  def valid_attributes
    {:game_id => Factory(:game).id,:ship_id => Factory(:ship).id,:hit_count => 0,:orientation => "horizontal",:sunk=> false, :x=> 0,:y=> 0}
  end

  def invalid_attributes
    {:game_id => Factory(:game).id}
  end

  describe "GET index" do
    it "assigns all game_ships as @game_ships" do
      game_ship = Factory(:game_ship)
      get :index
      assigns(:game_ships).should eq([game_ship])
    end
  end

  describe "GET show" do
    it "assigns the requested game_ship as @game_ship" do
      game_ship = Factory(:game_ship)
      get :show, :id => game_ship.id
      assigns(:game_ship).should eq(game_ship)
    end
  end

  describe "GET new" do
    it "assigns a new game_ship as @game_ship" do
      get :new
      assigns(:game_ship).should be_a_new(GameShip)
    end
  end

  describe "GET edit" do
    it "assigns the requested game_ship as @game_ship" do
      game_ship = Factory(:game_ship)
      get :edit, :id => game_ship.id
      assigns(:game_ship).should eq(game_ship)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new GameShip" do
        expect {
          xhr :post, :create, {:game_ship => valid_attributes}
        }.to change(GameShip, :count).by(1)
      end

      it "assigns a newly created game_ship as @game_ship" do
        xhr :post, :create, {:game_ship => valid_attributes}
        assigns(:game_ship).should be_a(GameShip)
        assigns(:game_ship).should be_persisted
      end

      it "redirects to the created game_ship" do
        xhr :post, :create, {:game_ship => valid_attributes}
        response.should render_template(:register)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved game_ship as @game_ship" do
        # Trigger the behavior that occurs when invalid params are submitted
        GameShip.any_instance.stub(:save).and_return(false)
        xhr :post, :create, {:game_ship => invalid_attributes}
        assigns(:game_ship).should be_a_new(GameShip)
      end

      it "renders the 'errors' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        GameShip.any_instance.stub(:save).and_return(false)
        xhr :post,:create, {:game_ship => invalid_attributes}
        puts assigns(:game_ship).errors.full_messages
        response.should render_template("errors.js")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested game_ship as @game_ship" do
        game_ship = GameShip.create! valid_attributes
        xhr :put, :update, {:id => game_ship.id, :game_ship => valid_attributes}
        assigns(:game_ship).should eq(game_ship)
      end

      it "redirects to the game_ship" do
        game_ship = GameShip.create! valid_attributes
        xhr :put, :update, {:id => game_ship.id, :game_ship => valid_attributes}
        if game_ship.valid?
          response.should render_template(:register)
        end
      end
    end

    describe "with invalid params" do
      it "assigns the game_ship as @game_ship" do
        game_ship = GameShip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GameShip.any_instance.stub(:save).and_return(false)
        xhr :put, :update, :id => game_ship.id, :game_ship => {}
        assigns(:game_ship).should eq(game_ship)
      end

      it "re-renders the 'edit' template" do
        game_ship = GameShip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        GameShip.any_instance.stub(:save).and_return(false)
        xhr :put, :update, :id => game_ship.id, :game_ship => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested game_ship" do
      game_ship = GameShip.create! valid_attributes
      expect {
        xhr :delete, :destroy, {:id => game_ship.id}
      }.to change(GameShip, :count).by(-1)
    end

    it "redirects to the game_ships list" do
      game_ship = GameShip.create! valid_attributes
      xhr :delete, :destroy,{:id => game_ship.id }
      response.should render_template(:register)
    end

   
  end

end
