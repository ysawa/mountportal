require 'spec_helper'

describe FiguresController do

  context 'when user signed in' do
    before :each do
      user_sign_in
    end

    describe "POST 'create'" do

      before :each do
        sample_file = File.join(Rails.root, 'spec/fixtures/images/rails.png')
        @image = fixture_file_upload(sample_file, 'image/png')
      end

      it "returns http success" do
        post 'create', figure: { content: @image }
        response.should be_success
      end

      it "creates new figure with image" do
        Figure.count.should == 0
        post 'create', figure: { content: @image }
        Figure.count.should == 1
        Figure.first.image.should_not be_nil
      end

      it "creates the correct JSON" do
        Figure.count.should == 0
        post 'create', figure: { content: @image }
        response_hash = JSON.parse response.body
        figure = Figure.last
        response_hash['id'].should == figure.id.to_s
        response_hash['data']['id'].should == figure.id.to_s
        response_hash['data']['image_url'].should be_present
        response_hash['data']['image_url'].should == figure.image.url
        response_hash['data']['small_image_url'].should be_present
        response_hash['data']['small_image_url'].should == figure.image.small.url
        response_hash['data']['thumb_image_url'].should be_present
        response_hash['data']['thumb_image_url'].should == figure.image.thumb.url
        response_hash['message'].should == 'OK'
      end
    end

    describe "DELETE 'destroy'" do

      before :each do
        @figure = Fabricate(:figure)
      end

      it "returns http success" do
        delete 'destroy', id: @figure.to_param
        response.should be_success
      end

      it "returns http success" do
        Figure.count.should == 1
        delete 'destroy', id: @figure.to_param
        Figure.count.should == 0
      end
    end
  end
end
