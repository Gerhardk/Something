require 'rails_helper'

describe GameShip do
  after :all do
     Game.destroy_all
     Ship.destroy_all
     Block.destroy_all
   end
  context "(Validations)" do
    [:ship_id, :game_id].each do |attr|
          it "must have a #{attr}" do
            g = Game.new
            g.should_not be_valid
            g.errors[attr].should_not be_nil
          end
     end
  end

  context "(Functionality)" do
    it "should create game_ships if max_per_game not maxed" do
      game_ship = Factory.create(:game_ship)
      game_ship.reload.should be_valid

    end

    it "should  not create game_ships if max_per_game is maxed" do
      lambda {
        ship = Factory(:ship, :max_per_game => 1)
        game = Factory(:game)
        Factory.create(:game_ship, :ship_id => ship.id, :game_id => game.id)
        GameShip.create(:game_id => game.id, :ship_id => ship.id)
      }.should change(GameShip, :count).by(1)


    end

    it "should update block to have a game_ship_id" do
      ship = Factory(:ship, :max_per_game => 1)
      game = Factory.create(:game)
      block = game.blocks.where(:server_board => false, :x => 0, :y => 0).last
      game_ship = Factory.create(:game_ship, :ship_id => ship.id, :game_id => game.id)
      block.game_ship_id.should == game_ship.id
    end

    it "should update game_ship to sunk if hit count == length" do
      ship = Factory(:ship, :max_per_game => 1, :length => 1)
      game = Factory.create(:game)
      game_ship = Factory.create(:game_ship, :ship_id => ship.id, :game_id => game.id)
      nuke = Factory.create(:nuke, :game_id => game.id, :x => 0, :y => 0, :server_nuke_boolean => true)
      game_ship.reload.hit_count.should == 1
      game_ship.reload.sunk.should == true
    end

    it "should update block to have a game_ship_id for vertical game_ship" do
      ship = Factory(:ship, :max_per_game => 1)
      game = Factory.create(:game)
      block = game.blocks.where(:server_board => false, :x => 0, :y => 0).last
      game_ship = Factory.create(:game_ship, :ship_id => ship.id, :game_id => game.id, :orientation => "vertical")
      block.game_ship_id.should == game_ship.id
    end

    it "should update block to nil game_ship_id when game_ship is destroyed" do
      ship = Factory(:ship, :max_per_game => 1, :length => 1)
      game = Factory.create(:game)
      game_ship = Factory.create(:game_ship, :ship_id => ship.id, :game_id => game.id, :orientation => "vertical")
      block = game.blocks.where(:server_board => false, :x => 0, :y => 0).last
      block.game_ship_id.should == game_ship.id
      game_ship.destroy
      block.game_ship_id.should ==nil
      ship2 = Factory(:ship, :max_per_game => 1, :length => 5)
      game_ship2 = Factory.create(:game_ship, :ship_id => ship2.id, :game_id => game.id, :orientation => "vertical")
      block = game.blocks.where(:server_board => false, :x => 0, :y => 0).last
      block.game_ship_id.should == game_ship2.id
      game_ship2.destroy
      block.game_ship_id.should ==nil

    end

  end

  context "(Assiocations)" do
    it "belong_to ship" do
      should respond_to(:ship)
    end

    it "belong_to game" do
      should respond_to(:game)
    end
  end
end
