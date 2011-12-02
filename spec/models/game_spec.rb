require 'spec_helper'

describe Game do
  after :all do
     Game.destroy_all
     Ship.destroy_all
     Block.destroy_all
   end
  context "(Validations)" do
    it "should create game instance given valid attributes" do
      lambda { Factory.create(:game) }.should change(Game, :count).by(1)
    end

    it "should give correct state to game" do
      game = Factory.create(:game)
      game.reload.should be_valid
      game.status.should == "in_progress"
    end

    [:name, :email].each do |attr|
      it "must have a #{attr}" do
        g = Game.new
        g.should_not be_valid
        g.errors[attr].should_not be_nil
      end
    end
  end

  context "(Assiocations)" do
    it "has many nukes" do
      should respond_to(:nukes)
    end

    it "has many game_ships" do
      should respond_to(:game_ships)
    end

    it "has many ships" do
      should respond_to(:ships)
    end

  end

  context "(Functionality)" do
    it "should create correct about of blocks" do
      game = Factory.create(:game)
      ### total blocks
      game.blocks.count.should == 200
      ### server blocks
      game.blocks.where(:server_board => true).count.should == 100
      ### player blocks
      game.blocks.where(:server_board => false).count.should == 100
    end

    it "should update server_hits" do
      game = Factory.create(:game)
      game_ship = Factory.create(:game_ship, :game_id => game.id)
      nuke = Factory.create(:nuke, :game_id => game.id, :x => 0, :y => 0, :server_nuke_boolean => true)
      game.server_hits.should == 1
    end

    it "should update client_hits" do
      game = Factory.create(:game)
      game_ship = Factory.create(:game_ship, :game_id => game.id)
      nuke = Factory.create(:nuke, :game_id => game.id, :x => 0, :y => 0, :status => "hit")

      game.client_hits.should == 1
    end

    it "should change state to win is player wins" do
      ship = Factory(:ship, :max_per_game => 1, :length => 1)

      game = Factory.create(:game)
      game_ship = Factory.create(:game_ship, :game_id => game.id, :ship_id => ship.id)
      nuke = Factory.create(:nuke, :game_id => game.id, :x => 0, :y => 0, :status => "hit")
      game.client_hits.should == 1



    end

    it "should change state to lost is server wins" do
      ship = Factory(:ship, :max_per_game => 1, :length => 1)

      game = Factory.create(:game)
      game_ship = Factory.create(:game_ship, :game_id => game.id, :ship_id => ship.id)
      nuke = Factory.create(:nuke, :game_id => game.id, :x => 0, :y => 0, :server_nuke_boolean => true)
      game.server_hits.should == 1



    end

  end


end
