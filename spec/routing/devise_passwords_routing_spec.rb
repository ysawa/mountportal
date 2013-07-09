require "spec_helper"

describe DevisePasswordsController do
  describe "routing" do

    it "routes to #create" do
      post("/users/password").should route_to("devise_passwords#create")
    end

    it "routes to #new" do
      get("/users/password/new").should route_to("devise_passwords#new")
    end

    it "routes to #edit" do
      get("/users/password/edit").should route_to("devise_passwords#edit")
    end

    it "routes to #update" do
      put("/users/password").should route_to("devise_passwords#update")
    end
  end
end
