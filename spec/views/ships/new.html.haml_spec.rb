require 'spec_helper'

describe "ships/new.html.haml" do
  before(:each) do
    assign(:ship, stub_model(Ship,
      :name => "MyString",
      :length => 1
    ).as_new_record)
  end

  it "renders new ship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ships_path, :method => "post" do
      assert_select "input#ship_name", :name => "ship[name]"
      assert_select "input#ship_length", :name => "ship[length]"
    end
  end
end
