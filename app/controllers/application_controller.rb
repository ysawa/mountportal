class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

protected

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
end
