require 'spec_helper'

describe "blocks/new.html.haml" do
  before(:each) do
    assign(:block, stub_model(Block,
      :game_id => 1,
      :game_ship_id => 1,
      :x => 1,
      :y => 1,
      :state => "MyString",
      :server_board => false
    ).as_new_record)
  end

  it "renders new block form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => blocks_path, :method => "post" do
      assert_select "input#block_game_id", :name => "block[game_id]"
      assert_select "input#block_game_ship_id", :name => "block[game_ship_id]"
      assert_select "input#block_x", :name => "block[x]"
      assert_select "input#block_y", :name => "block[y]"
      assert_select "input#block_state", :name => "block[state]"
      assert_select "input#block_server_board", :name => "block[server_board]"
    end
  end
end
