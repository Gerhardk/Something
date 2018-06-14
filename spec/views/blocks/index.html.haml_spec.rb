require 'rails_helper'

describe "blocks/index.html.haml" do
  before(:each) do
    assign(:blocks, [
      stub_model(Block,
        :game_id => 1,
        :game_ship_id => 1,
        :x => 1,
        :y => 1,
        :state => "State",
        :server_board => false
      ),
      stub_model(Block,
        :game_id => 1,
        :game_ship_id => 1,
        :x => 1,
        :y => 1,
        :state => "State",
        :server_board => false
      )
    ])
  end

  it "renders a list of blocks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 8
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 8
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 8
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 8
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "State".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
