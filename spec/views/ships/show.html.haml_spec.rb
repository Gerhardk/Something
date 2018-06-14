require 'rails_helper'

describe "ships/show.html.haml" do
  before(:each) do
    @ship = assign(:ship, stub_model(Ship,
      :name => "Name",
      :length => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
