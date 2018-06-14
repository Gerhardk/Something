require 'rails_helper'

describe "blocks/edit.html.haml" do
  before(:each) do
    @block = assign(:block, stub_model(Block,
      :game_id => 1,
      :game_ship_id => 1,
      :x => 1,
      :y => 1,
      :state => "MyString",
      :server_board => false
    ))
  end

  it "renders the edit block form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blocks_path(@block), :method => "post" do
      assert_select "input#block_game_id", :name => "block[game_id]"
      assert_select "input#block_game_ship_id", :name => "block[game_ship_id]"
      assert_select "input#block_x", :name => "block[x]"
      assert_select "input#block_y", :name => "block[y]"
      assert_select "input#block_state", :name => "block[state]"
      assert_select "input#block_server_board", :name => "block[server_board]"
    end
  end
end
