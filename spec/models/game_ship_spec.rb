require 'spec_helper'

describe GameShip do
  context "(Functionality)" do
    it "should create game_ships if max_per_game not maxed" do
      game_ship = Factory.create(:game_ship)
      game_ship.reload.should be_valid

    end

    it "should  not create game_ships if max_per_game not maxed" do
      game_ship = Factory.create(:game_ship)
      game_ship.reload.should be_valid
      game_ship2 = Factory.create(:game_ship)
      game_ship2.reload.should_not be_valid

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
