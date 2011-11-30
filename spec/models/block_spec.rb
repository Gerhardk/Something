require 'spec_helper'

describe Block do
  before :all do
    @game = Factory.create(:game)
    @block1 = @game.blocks.where(:server_board => false).first
    @block2 = @game.blocks.where(:server_board => false).last
    @game_ship = Factory.create(:game_ship, :game_id => @game.id)

  end

  after :all do
    Game.destroy_all
    Ship.destroy_all
    Block.destroy_all
  end

  context "(Validations)" do
    it "should create block instance given valid attributes" do
      lambda { Factory.create(:game) }.should change(Block, :count).by(200)
    end

    [:game_id].each do |attr|
      it "must have a #{attr}" do
        b = Block.new
        b.should_not be_valid
        b.errors[attr].should_not be_nil
      end
    end
  end

  context "(Assiocations)" do
    it "belongs_to game" do
      should respond_to(:game)
    end
    it "belongs_to game_ship" do
      should respond_to(:game_ship)
    end

  end

  context "(Functionality)" do
    it "should create blocks with correct state" do
      @block1.state.should == "in_play"
    end

    it "should change blocks state to hit" do

      @nuke = Factory.create(:nuke, :game_id => @game.id, :x => 0, :y => 0, :server_nuke_boolean => true)
      @block1.reload.state.should == "hit"
    end

    it "should change blocks state to miss" do

      @nuke = Factory.create(:nuke, :game_id => @game.id, :x => 9, :y => 9, :server_nuke_boolean => true)
      @block2.reload.state.should == "miss"
    end


  end
end
