class ProfilesController < ApplicationController

  before_filter :authenticate_user!, only: [:edit, :show, :update]
  before_filter :set_user, only: [:edit, :show, :update]
  before_filter :user_should_be_current_user, only: [:edit, :update]

  def edit
  end

  def show
  end

  def update
    @user.attributes = user_params
    if @user.save
      make_notice(User.model_name.human)
      redirect_to profile_path(@user)
    else
      render action: 'edit'
    end
  end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params[:user] # .require(:user).permit(:content, :face_id, :male, :name)
  end

  def user_should_be_current_user
    unless @user == current_user
      redirect_to profile_path(@user)
    end
  end
end
