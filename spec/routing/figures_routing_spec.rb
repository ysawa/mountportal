require "spec_helper"

describe FiguresController do
  describe "routing" do

    it "routes to #create" do
      post("/figures").should route_to("figures#create")
    end

    it "routes to #destroy" do
      delete("/figures/1").should route_to("figures#destroy", id: '1')
    end
  end
end
