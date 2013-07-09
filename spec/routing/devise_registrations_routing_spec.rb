require "spec_helper"

describe DeviseRegistrationsController do
  describe "routing" do

    it "routes to #create" do
      post("/users").should route_to("devise_registrations#create")
    end

    it "routes to #new" do
      get("/users/sign_up").should route_to("devise_registrations#new")
    end
  end
end
