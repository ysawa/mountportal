require "spec_helper"

describe TreksController do
  describe "routing" do

    it "routes to #index" do
      get("/treks").should route_to("treks#index")
    end

    it "routes to #new" do
      get("/treks/new").should route_to("treks#new")
    end

    it "routes to #show" do
      get("/treks/1").should route_to("treks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/treks/1/edit").should route_to("treks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/treks").should route_to("treks#create")
    end

    it "routes to #update" do
      put("/treks/1").should route_to("treks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/treks/1").should route_to("treks#destroy", :id => "1")
    end

  end
end
