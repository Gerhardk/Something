require 'spec_helper'

describe Block do
  context "(Validations)" do
    it "should create game instance given valid attributes" do
          lambda { Factory.create(:block) }.should change(Block, :count).by(1)
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
end
