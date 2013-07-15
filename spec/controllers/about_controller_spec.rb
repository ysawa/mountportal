require 'spec_helper'

describe AboutController do

  describe "GET 'tos'" do
    it "returns http success" do
      get 'tos'
      response.should be_success
    end
  end
end
