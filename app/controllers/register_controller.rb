class RegisterController < ApplicationController
  def index

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
        name: params[:user][:name],
        email: params[:user][:email],
        password: params[:user][:password],
        wedding_password: params[:user][:wedding_password]
    )
    if @user.save
      log_user_in(@user)
      redirect_to '/welcome'
    else
      render 'new'
    end
  end
end