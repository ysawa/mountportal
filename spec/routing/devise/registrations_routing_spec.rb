require "spec_helper"

describe Devise::RegistrationsController do
  describe "routing" do

    it "routes to #nwe" do
      get("/users/sign_up").should route_to("devise/registrations#new")
    end
  end
end
