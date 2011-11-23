require "spec_helper"

describe GameShipsController do
  describe "routing" do

    it "routes to #index" do
      get("/game_ships").should route_to("game_ships#index")
    end

    it "routes to #new" do
      get("/game_ships/new").should route_to("game_ships#new")
    end

    it "routes to #show" do
      get("/game_ships/1").should route_to("game_ships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/game_ships/1/edit").should route_to("game_ships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/game_ships").should route_to("game_ships#create")
    end

    it "routes to #update" do
      put("/game_ships/1").should route_to("game_ships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/game_ships/1").should route_to("game_ships#destroy", :id => "1")
    end

  end
end
