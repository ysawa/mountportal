require 'spec_helper'

describe ProfilesController do

  before :each do
    @user = Fabricate(:user, name: 'not_signed_in')
    @user_signed_in = Fabricate(:user, name: 'signed_in')
  end

  describe "GET 'show'" do
    context 'with NOT singing in' do
      it "returns http redirect to sign in" do
        get 'show', id: @user.to_param
        response.should redirect_to new_user_session_path
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user_signed_in)
      end

      it "returns http success for @user" do
        get 'show', id: @user.to_param
        response.should be_success
      end

      it "returns http success for @user_signed_in" do
        get 'show', id: @user_signed_in.to_param
        response.should be_success
      end
    end
  end

  describe "GET 'edit'" do
    context 'with NOT singing in' do
      it "returns http redirect to sign in" do
        get 'edit', id: @user.to_param
        response.should redirect_to new_user_session_path
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user_signed_in)
      end

      it "cannot edit @user" do
        get 'edit', id: @user.to_param
        assigns(:user).should == @user
        response.should redirect_to(profile_path(@user))
      end

      it "can edit @user_signed_in" do
        get 'edit', id: @user_signed_in.to_param
        assigns(:user).should == @user_signed_in
        response.should be_success
      end
    end
  end

  describe "GET 'update'" do
    context 'with NOT singing in' do
      it "returns http redirect to sign in" do
        put 'update', id: @user.to_param, user: {}
        response.should redirect_to new_user_session_path
      end
    end

    context 'with singing in' do
      before :each do
        user_sign_in(@user_signed_in)
      end

      it "cannot update @user" do
        put 'update', id: @user.to_param, user: { name: 'New Name' }
        assigns(:user).should == @user
        @user.reload
        response.should redirect_to(profile_path(@user))
      end

      it "returns http success to @user_signed_in" do
        put 'update', id: @user_signed_in.to_param, user: { name: 'New Name' }
        assigns(:user).should == @user_signed_in
        response.should redirect_to(profile_path(@user_signed_in))
      end
    end
  end
end
