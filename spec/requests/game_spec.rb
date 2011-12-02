require 'spec_helper'


describe "Register" do

  def valid_attributes
    {:email => "rgkoek@yahoo.com", :name => "Gerhard"}
  end
  describe "GET /register" do

    it "fetches the content form request" do
      FakeWeb.register_uri(:post, "http://example.com/", :body =>({:status => "hit", :x => 0, :y => 0}).to_json)
      game = Game.create! valid_attributes
      # Trigger the behavior that occurs when invalid params are submitted
      Game.any_instance.stub(:save).and_return(false)
      response = game.send_request_to_server("http://example.com/")
      response.should_not be_empty
    end
  end


 

end
