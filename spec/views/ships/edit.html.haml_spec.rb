require 'rails_helper'

describe "ships/edit.html.haml" do
  before(:each) do
    @ship = assign(:ship, stub_model(Ship,
      :name => "MyString",
      :length => 1
    ))
  end

  it "renders the edit ship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ships_path(@ship), :method => "post" do
      assert_select "input#ship_name", :name => "ship[name]"
      assert_select "input#ship_length", :name => "ship[length]"
    end
  end
end
