class RsvpController < ApplicationController

  def index

  end

  def new

  end

  def create
    user = User.create(name: params[:name])
    session[:user_id] = user.id
    redirect_to '/welcome'
  end

end