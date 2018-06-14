require 'rails_helper'

describe "games/show.html.haml" do
  before(:each) do
    @game = assign(:game, stub_model(Game))
  end

  it "renders attributes in <p>" do
    render
  end
end
