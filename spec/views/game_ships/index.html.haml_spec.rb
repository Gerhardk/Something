require 'spec_helper'

describe "game_ships/index.html.haml" do
  before(:each) do
    assign(:game_ships, [
      stub_model(GameShip,
        :game_id => 1,
        :ship_id => 1,
        :sunk => false,
        :hit_count => 1,
        :orientation => "Orientation",
        :x => 1,
        :y => 1
      ),
      stub_model(GameShip,
        :game_id => 1,
        :ship_id => 1,
        :sunk => false,
        :hit_count => 1,
        :orientation => "Orientation",
        :x => 1,
        :y => 1
      )
    ])
  end

  it "renders a list of game_ships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 10
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 10
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 10
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Orientation".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 10
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 10
  end
end
