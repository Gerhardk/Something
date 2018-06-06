require 'rails_helper'
describe GameShipsController do
  let!(:game) { create(:game) }
  let!(:ship) { create(:ship) }

  def valid_attributes
    { :game_id => game.id, :ship_id => ship.id, :hit_count => 0, :orientation => "horizontal", :sunk=> false, :x=> 0, :y=> 0}
  end

  def invalid_attributes
    { :game_id => game.id, :block_id => ship.id }
  end

  describe "GET index" do
    it "assigns all game_ships as @game_ships" do
      game_ship = create(:game_ship)
      get :index
      expect(assigns(:game_ships)).to eq([game_ship])
    end
  end

  describe "GET show" do
    it "assigns the requested game_ship as @game_ship" do
      game_ship = create(:game_ship)
      get :show, params: { id: game_ship.id }
      expect(assigns(:game_ship)).to eq(game_ship)
    end
  end

  describe "GET new" do
    it "assigns a new game_ship as @game_ship" do
      get :new
      expect(assigns(:game_ship)).to be_a_new(GameShip)
    end
  end

  describe "GET edit" do
    it "assigns the requested game_ship as @game_ship" do
      game_ship = create(:game_ship)
      get :edit, params: { :id => game_ship.id }
      expect(assigns(:game_ship)).to eq(game_ship)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new GameShip" do
        expect {
          post :create, xhr: true, params: { :game_ship => valid_attributes }
        }.to change(GameShip, :count).by(1)
      end

      it "assigns a newly created game_ship as @game_ship" do
        post :create, xhr: true, params: { :game_ship => valid_attributes }
        expect(assigns(:game_ship)).to be_a(GameShip)
        expect(assigns(:game_ship)).to be_persisted
      end

      it "redirects to the created game_ship" do
        post :create, xhr: true, params: { :game_ship => valid_attributes }
        expect(response).to render_template(:register)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved game_ship as @game_ship" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(GameShip).to receive(:save).and_return(false)
        post :create, xhr: true, params: { :game_ship => invalid_attributes }
        expect(assigns(:game_ship)).to be_a_new(GameShip)
      end

      it "renders the 'errors' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(GameShip).to receive(:save).and_return(false)
        post :create, xhr: true, params: { :game_ship => invalid_attributes }
        expect(assigns(:game_ship).errors).to_not be_empty
        expect(response).to render_template("game_ships/errors.js.erb")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "assigns the requested game_ship as @game_ship" do
        game_ship = GameShip.create! valid_attributes
        post :update, xhr: true, params: {:id => game_ship.id, :game_ship => {:hit_count => 1 }}
        expect(assigns(:game_ship)).to eq(game_ship)
        expect(game_ship.reload.hit_count).to eq(1)
      end

      it "redirects to the game_ship" do
        game_ship = GameShip.create! valid_attributes
        post :update, xhr: true, params: {:id => game_ship.id, :game_ship => {:hit_count => 10}}
        expect(response).to render_template(:register)
      end
    end

    describe "with invalid params" do
      it "assigns the game_ship as @game_ship" do
        game_ship = GameShip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(GameShip).to receive(:save).and_return(false)
        post :update, xhr: true, params: {:id => game_ship.id, :game_ship => invalid_attributes}
        expect(assigns(:game_ship)).to eq(game_ship)
      end

      it "re-renders the 'edit' template" do
        game_ship = GameShip.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(GameShip).to receive(:save).and_return(false)
        post :update, xhr: true, params: {:id => game_ship.id, :game_ship => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested game_ship" do
      game_ship = GameShip.create! valid_attributes
      expect {
        delete :destroy, xhr: true, params: {:id => game_ship.id}
      }.to change(GameShip, :count).by(-1)
    end

    it "redirects to the game_ships list" do
      game_ship = GameShip.create! valid_attributes
      delete :destroy, xhr: true, params: {:id => game_ship.id}
      expect(response).to render_template(:register)
    end
  end
end
