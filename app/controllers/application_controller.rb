class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_users_cache

protected

  def current_user_should_be_completed
    if user_signed_in?
      unless current_user.completed?
        flash[:notice] = t('notices.please_complete_first', model: t('users.profile'))
        redirect_to edit_profile_path(current_user)
      end
    else
    end
  end

  def make_notice(model_name, ref_name = nil, right_now = false)
    unless ref_name
      ref_name = action_name
    end

    if ref_name
      notice = t("notices.#{ref_name}", model: model_name)
      if right_now
        flash.now[:notice] = notice
      else
        flash[:notice] = notice
      end
    end
  end

  def set_users_cache
    @users_cache = CollectionCache.new(User, current_user)
  end
end
