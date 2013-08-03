class ProfilesController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :show, :update]
  before_action :set_user, only: [:edit, :show, :update]
  before_action :user_should_be_current_user, only: [:edit, :update]

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
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
    params.require(:user).permit(:name)
  end

  def user_should_be_current_user
    unless @user == current_user
      redirect_to profile_path(@user)
    end
  end
end
