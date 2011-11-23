require 'spec_helper'

describe "game_ships/edit.html.haml" do
  before(:each) do
    @game_ship = assign(:game_ship, stub_model(GameShip,
      :game_id => 1,
      :ship_id => 1,
      :sunk => false,
      :hit_count => 1,
      :orientation => "MyString",
      :x => 1,
      :y => 1
    ))
  end

  it "renders the edit game_ship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => game_ships_path(@game_ship), :method => "post" do
      assert_select "input#game_ship_game_id", :name => "game_ship[game_id]"
      assert_select "input#game_ship_ship_id", :name => "game_ship[ship_id]"
      assert_select "input#game_ship_sunk", :name => "game_ship[sunk]"
      assert_select "input#game_ship_hit_count", :name => "game_ship[hit_count]"
      assert_select "input#game_ship_orientation", :name => "game_ship[orientation]"
      assert_select "input#game_ship_x", :name => "game_ship[x]"
      assert_select "input#game_ship_y", :name => "game_ship[y]"
    end
  end
end
