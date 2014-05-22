class ApplicationController < ActionController::Base

  def log_user_in(user)
    session[:id] = user.id
  end

end
