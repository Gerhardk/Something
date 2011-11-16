require 'spec_helper'

describe Ship do
  context "Validations" do
    it "should create ship instance given valid attributes" do
      lambda { Factory.create(:ship) }.should change(Ship, :count).by(1)
    end

    [:name, :length].each do |attr|
      it "must have a #{attr}" do
        s = Ship.new
        s.should_not be_valid
        s.errors[attr].should_not be_nil
      end
    end
  end
end
