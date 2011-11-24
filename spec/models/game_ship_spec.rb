require 'spec_helper'

describe GameShip do
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
