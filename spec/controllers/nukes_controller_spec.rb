require 'rails_helper'
describe NukesController do
  def valid_attributes
    @game = Factory(:game)
    {"game_id"=>"#{@game.id}", "x"=>"9", "y"=>"4"}
  end

  describe "GET index" do
    it "assigns all nukes as @nukes" do
      nuke = Factory.create(:nuke)
      get :index
      assigns(:nukes).should eq([nuke])
    end
  end

  describe "GET show" do
    it "assigns the requested nuke as @nuke" do
      nuke = Factory.create(:nuke)
      get :show, :id => nuke.id
      assigns(:nuke).should eq(nuke)
    end
  end

  describe "GET new" do
    it "assigns a new nuke as @nuke" do
      get :new
      assigns(:nuke).should be_a_new(Nuke)
    end
  end

  describe "GET edit" do
    it "assigns the requested nuke as @nuke" do
      nuke = Factory.create(:nuke)
      get :edit, :id => nuke.id
      assigns(:nuke).should eq(nuke)
    end
  end



  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested nuke" do
        nuke = Factory.create(:nuke)
        # Assuming there are no other nukes in the database, this
        # specifies that the Nuke created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Nuke.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => nuke.id, :nuke => {'these' => 'params'}
      end

      it "assigns the requested nuke as @nuke" do
        nuke = Factory.create(:nuke)
        put :update, :id => nuke.id, :nuke => valid_attributes
        assigns(:nuke).should eq(nuke)
      end

      it "redirects to the nuke" do
        nuke = Factory.create(:nuke)
        put :update, :id => nuke.id, :nuke => valid_attributes
        response.should redirect_to(nuke)
      end
    end


  end

  describe "DELETE destroy" do
    it "destroys the requested nuke" do
      nuke = Factory.create(:nuke)
      expect {
        delete :destroy, :id => nuke.id
      }.to change(Nuke, :count).by(-1)
    end

    it "redirects to the nukes list" do
      nuke = Factory.create(:nuke)
      delete :destroy, :id => nuke.id
      response.should redirect_to(nukes_url)
    end
  end


  describe "Create" do
    it "should create a nuke " do
      @game = Factory(:game, :server_game_id => 622)
      # Trigger the behavior that occurs when invalid params are submitted

      VCR.use_cassette('nuke_request', :record => :new_episodes) do

        xhr :get, :create, :nuke => {"game_id"=>"#{@game.id}", "x"=>"0", "y"=>"0", "server_nuke_boolean"=>"false"}

      end
      response.should render_template(:battle)
      
    end

    it "should render errors.js if invalid nuke" do
      VCR.use_cassette('nuke_request', :record => :new_episodes) do

        xhr :get, :create, :nuke => {"game_id"=>"#{nil}", "x"=>"0", "y"=>"0", "server_nuke_boolean"=>"false"}

      end
      response.should render_template("nukes/errors.js")

    end
  end

end
