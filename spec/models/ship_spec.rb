require 'spec_helper'

describe Ship do
  context "Validations" do
    it "should create ship instance given valid attributes" do
      lambda { Factory.create(:ship) }.should change(Ship, :count).by(1)
    end
  end
end
