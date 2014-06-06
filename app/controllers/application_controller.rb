class ApplicationController < ActionController::Base

  def log_user_in(user)
    session[:id] = user.id
  end

  def log_user_out
    session[:id] = nil
  end


  helper_method :log_user_out
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end
end
