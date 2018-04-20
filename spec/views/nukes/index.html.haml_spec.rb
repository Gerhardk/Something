require 'rails_helper'

describe "nukes/index.html.haml" do
  before(:each) do
    assign(:nukes, [
      stub_model(Nuke),
      stub_model(Nuke)
    ])
  end

  it "renders a list of nukes" do
    render
  end
end
