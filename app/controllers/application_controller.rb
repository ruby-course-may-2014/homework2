class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied!

  protected

  def permission_denied!(ex)
    flash[:error] = "You are not allowed!"
    redirect_to root_url
  end
end
