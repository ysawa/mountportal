require "spec_helper"

describe Devise::SessionsController do
  describe "routing" do

    it "routes to #nwe" do
      get("/users/sign_in").should route_to("devise/sessions#new")
    end
  end
end
