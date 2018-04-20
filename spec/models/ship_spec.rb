require 'rails_helper'

describe Ship do
  after :all do
     Game.destroy_all
     Ship.destroy_all
     Block.destroy_all
   end
  context "(Validations)" do
    it "should create ship instance given valid attributes" do
      lambda { Factory.create(:ship) }.should change(Ship, :count).by(1)
    end

    [:name, :length, :max_per_game].each do |attr|
      it "must have a #{attr}" do
        s = Ship.new
        s.should_not be_valid
        s.errors[attr].should_not be_nil
      end
    end

    [:length, :max_per_game].each do |attr|
      specify "requires #{attr} to be numerical" do
        s = Ship.new
        s[attr] = "ABC"
        s.should_not be_valid
        s.errors[attr].should_not be_empty
      end
    end
  end

  context "(Assiocations)" do
    it "has many game_ships" do
      should respond_to(:game_ships)
    end

    it "has many games" do
      should respond_to(:games)
    end
  end

end
