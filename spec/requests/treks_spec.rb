require 'spec_helper'

describe "Treks" do
  describe "GET /treks" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get treks_path
      response.status.should be(200)
    end
  end
end
