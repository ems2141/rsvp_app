class RsvpController < ApplicationController

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
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else
      render 'new'
    end
  end
end