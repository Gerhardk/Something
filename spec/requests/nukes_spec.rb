require 'rails_helper'

describe "Nukes" do
  describe "GET /nukes" do
    describe "GET /nuke" do
      it "fetches the content form request" do
        game = Factory(:game)
        stub_request(:post, "http://example.com/", :body =>({"game_id"=>"#{game.id}", "x"=>"9", "y"=>"4"}).to_json)
        nuke = Factory.create(:nuke)
        # Trigger the behavior that occurs when invalid params are submitted
        
        response = nuke.send_nuke_to_server("http://example.com/")
        response.should_not be_empty
      end
    end
  end
end
