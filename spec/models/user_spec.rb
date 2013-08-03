require 'spec_helper'

describe User do

  it 'can be initialized' do
    user = User.new
    user.should_not be_persisted
  end

  describe '#completed?' do
    before :each do
      @user = Fabricate(:user)
    end

    it 'returns false if is not completed' do
      @user.name = ''
      @user.male = nil
      @user.completed?.should be_false
    end

    it 'returns false if is not completed' do
      @user.name = 'New Name'
      @user.male = true
      @user.completed?.should be_true
      @user.male = false
      @user.completed?.should be_true
    end
  end
end
