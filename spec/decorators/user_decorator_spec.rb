require 'spec_helper'

describe UserDecorator do

  before :each do
    @user = Fabricate(:user)
    @decorator = UserDecorator.new(@user)
  end

  describe '#face' do

    it 'generates male face image of noimage' do
      @user.face = nil
      @user.male = true
      @decorator.face.should include 'male.png'
    end

    it 'generates male face image of noimage' do
      @user.face = nil
      @user.male = false
      @decorator.face.should include 'female.png'
    end

    context 'if user signed in' do
      it 'generates figure image' do
        @figure = Fabricate(:image_figure)
        @user.face = @figure
        @decorator.face(user_signed_in: true).should include @figure.image.thumb.url
      end
    end
  end
end
