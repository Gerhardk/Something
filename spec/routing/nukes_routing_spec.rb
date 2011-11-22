require "spec_helper"

describe NukesController do
  describe "routing" do

    it "routes to #index" do
      get("/nukes").should route_to("nukes#index")
    end

    it "routes to #new" do
      get("/nukes/new").should route_to("nukes#new")
    end

    it "routes to #show" do
      get("/nukes/1").should route_to("nukes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/nukes/1/edit").should route_to("nukes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/nukes").should route_to("nukes#create")
    end

    it "routes to #update" do
      put("/nukes/1").should route_to("nukes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/nukes/1").should route_to("nukes#destroy", :id => "1")
    end

  end
end
