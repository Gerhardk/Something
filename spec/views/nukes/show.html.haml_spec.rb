require 'spec_helper'

describe "nukes/show.html.haml" do
  before(:each) do
    @nuke = assign(:nuke, stub_model(Nuke))
  end

  it "renders attributes in <p>" do
    render
  end
end
