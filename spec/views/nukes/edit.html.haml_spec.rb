require 'spec_helper'

describe "nukes/edit.html.haml" do
  before(:each) do
    @nuke = assign(:nuke, stub_model(Nuke))
  end

  it "renders the edit nuke form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nukes_path(@nuke), :method => "post" do
    end
  end
end
