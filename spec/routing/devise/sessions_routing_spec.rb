require "spec_helper"

describe Devise::SessionsController do
  describe "routing" do

    it "routes to #create" do
      post("/users/sign_in").should route_to("devise/sessions#create")
    end

    it "routes to #new" do
      get("/users/sign_in").should route_to("devise/sessions#new")
    end
  end
end
