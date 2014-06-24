class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :permission_denied!
  helper_method :allow

  protected

  def allow(movie = @movie)
    Pundit.policy!(current_user, movie)
  end

  def permission_denied!(ex)
    flash[:error] = "You are not allowed!"
    redirect_to root_url
  end

  def wrap_movie(movie)
    if allow(movie).publish? && !movie.draft? && movie.draft
      movie.draft
    else
      movie
    end
  end
end
