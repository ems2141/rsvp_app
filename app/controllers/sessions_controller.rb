class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      log_user_in(@user)
      flash[:login_message] = "Welcome back #{@user.email}"
      redirect_to '/welcome'
    else
      flash[:failed_login] = "Invalid email or password"
      render 'login/index'
    end
  end

  def destroy
    log_user_out
    redirect_to '/login', notice: "You have been logged out"
  end
end