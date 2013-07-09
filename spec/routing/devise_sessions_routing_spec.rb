require "spec_helper"

describe DeviseSessionsController do
  describe "routing" do

    it "routes to #create" do
      post("/users/sign_in").should route_to("devise_sessions#create")
    end

    it "routes to #new" do
      get("/users/sign_in").should route_to("devise_sessions#new")
    end
  end
end
