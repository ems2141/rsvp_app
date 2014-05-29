class ApplicationController < ActionController::Base

  def log_user_in(user)
    session[:id] = user.id
  end

  def log_user_out
    session[:id] = nil
  end
  helper_method :log_user_out

end
