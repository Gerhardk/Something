require 'rails_helper'

describe ServerShip do
  context "(Assiocations)" do
    it "belongs_to game" do
      should respond_to(:game)
    end


  end
end
