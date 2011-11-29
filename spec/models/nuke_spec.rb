require 'spec_helper'

describe Nuke do
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
end
