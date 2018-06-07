require 'rails_helper'

describe GamesController do
  def valid_attributes
    {:email => "rgkoek@yahoo.com", :name => "Gerhard"}
  end
  
  def invalid_attributes
    { ship_id: 1, block_id: 1}
  end

  describe "GET index" do
    it "assigns all games as @games" do
      game = Game.create! valid_attributes
      get :index
      expect(assigns(:games)).to eq([game])
    end
  end

  describe "GET show" do
    it "assigns the requested game as @game" do
      game = Game.create! valid_attributes
      get :show, params: { :id => game.id }
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "GET new" do
    it "assigns a new game as @game" do
      get :new
      expect(assigns(:game)).to be_a_new(Game)
    end
  end

  describe "GET edit" do
    it "assigns the requested game as @game" do
      game = Game.create! valid_attributes
      get :edit, params: { :id => game.id }
      expect(assigns(:game)).to eq(game)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Game" do
        expect {
          post :create, params: {:game => valid_attributes }
        }.to change(Game, :count).by(1)
      end

      it "assigns a newly created game as @game" do
        post :create, params: {:game => valid_attributes }
        expect(assigns(:game)).to be_a(Game)
        expect(assigns(:game)).to be_persisted
      end

      it "redirects to the created game" do
        post :create, params: {:game => valid_attributes }
        expect(response).to redirect_to(game_path(Game.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved game as @game" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Game).to receive(:save).and_return(false)
        post :create, params: { :game => invalid_attributes }
        expect(assigns(:game)).to be_a_new(Game)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Game).to receive(:save).and_return(false)
        post :create, params: { :game => invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested game" do
        game = Game.create! valid_attributes
        put :update, params: {:id => game.id, :game => {'name' => 'params'}}
        expect(game.reload.name).to eq('params')
      end

      it "assigns the requested game as @game" do
        game = Game.create! valid_attributes
        put :update, params: {:id => game.id, :game => valid_attributes}
        expect(assigns(:game)).to eq(game)
      end

      it "redirects to the game" do
        game = Game.create! valid_attributes
        put :update, params: {:id => game.id, :game => valid_attributes}
        expect(response).to redirect_to(games_path)
      end
    end

    describe "with invalid params" do
      it "assigns the game as @game" do
        game = Game.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Game).to receive(:save).and_return(false)
        put :update, params: { id: game.id, game: { ship_id: "Hello"} }
        expect(assigns(:game)).to eq(game)
      end

      it "re-renders the 'edit' template" do
        game = Game.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Game).to receive(:save).and_return(false)
        put :update, params: { id: game.id, game: { ship_id: "Hello"} }
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested game" do
      game = Game.create! valid_attributes
      expect {
        delete :destroy, params: { :id => game.id }
      }.to change(Game, :count).by(-1)
    end

    it "redirects to the games list" do
      game = Game.create! valid_attributes
      delete :destroy, params: { :id => game.id }
      expect(response).to redirect_to(games_url)
    end
  end


  describe "Battle" do
    it "assigns the game as @game" do
        game = Game.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(Game).to receive(:save).and_return(false)
        get :battle, params: {:id => game.id}
        expect(assigns(:game)).to eq(game)
    end
  end

  describe "Register" do
    it "should respond with json data" do
      game = Game.create! valid_attributes
      # Trigger the behavior that occurs when invalid params are submitted
      allow_any_instance_of(Game).to receive(:save).and_return(false)
      VCR.use_cassette('game_request', :record => :new_episodes) do
        get :register, params: {:id => game.id}
      end
      expect(assigns(:game)).to eq(game)
      expect(response).to redirect_to(battle_game_path(game))
    end
  end
end
