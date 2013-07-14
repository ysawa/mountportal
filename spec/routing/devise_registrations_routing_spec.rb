require "spec_helper"

describe DeviseRegistrationsController do
  describe "routing" do

    it "routes to #create" do
      post("/users").should route_to("devise_registrations#create")
    end

    it "routes to #edit" do
      get("/users/edit").should route_to("devise_registrations#edit")
    end

    it "routes to #new" do
      get("/users/sign_up").should route_to("devise_registrations#new")
    end

    it "routes to #update" do
      put("/users").should route_to("devise_registrations#update")
    end
  end
end
