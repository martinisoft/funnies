class ApplicationController < ActionController::Base
  protect_from_forgery

  layout :layout_by_resource

  def after_sign_in_path_for(resource_or_scope)
    case resource_or_scope
    when :user, User
      user_comics_path(:username => current_user.username)
    else
      super
    end
  end

  def authenticated
    redirect_to root_url unless user_signed_in?
  end

  def layout_by_resource
    if devise_controller?
      "session"
    else
      "application"
    end
  end
end
