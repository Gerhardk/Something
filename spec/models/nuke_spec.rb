require 'spec_helper'

describe Nuke do
  before :all do
    @game = Factory.create(:game)
    @ship = Factory.create(:ship)
    @game_ship = Factory.create(:game_ship, :game_id => @game.id, :ship_id => @ship.id)
  end

  after :all do
    Game.destroy_all
  end

  context "(Validations)" do
    it "should create game instance given valid attributes" do
      lambda { Factory.create(:nuke) }.should change(Nuke, :count).by(1)
    end

    [:game_id, :x, :y].each do |attr|
      it "must have a #{attr}" do
        n = Nuke.new
        n.should_not be_valid
        n.errors[attr].should_not be_nil
      end
    end
    [:x, :y].each do |attr|
      specify "requires #{attr} to be numerical" do
        n = Nuke.new
        n[attr] = "ABC"
        n.should_not be_valid
        n.errors[attr].should_not be_empty
      end
    end

  end
  context "(Assiocations)" do
    it "belongs_to game" do
      should respond_to(:game)
    end


  end

  context "(Functionality)" do
    it "should update server_nuke to miss" do
      @server_nuke = Factory.create(:nuke, :game_id => @game.id, :x => 1, :y => 1, :server_nuke_boolean => true )

      @server_nuke.reload.status.should == "miss"
    end

    it "should update server_nuke to hit" do
      @server_nuke2 = Factory.create(:nuke, :game_id => @game.id, :x => 0, :y => 0, :server_nuke_boolean => true )

      @server_nuke2.reload.status.should == "hit"
    end
  end
end
