require 'spec_helper'

describe "nukes/new.html.haml" do
  before(:each) do
    assign(:nuke, stub_model(Nuke).as_new_record)
  end

  it "renders new nuke form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => nukes_path, :method => "post" do
    end
  end
end
