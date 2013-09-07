require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  protect_from_forgery with: :exception

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

  def authenticate_admin
    unless current_user.admin?
      redirect_to :back, alert: "You do not have access to that action"
    end
  end

end
