class RsvpController < ApplicationController

  def index

  end

  def new

  end

  def create
    wedding_pass = params[:wedding_password]
    if wedding_pass == "ellieandnick2015"
      hashed_pass = BCrypt::Password.create(params[:guest_password])
      user = User.create(name: params[:name], user_password: hashed_pass)
      session[:user_id] = user.id
      redirect_to '/welcome'
    else
      redirect_to '/rsvp', notice: "I'm sorry but you do not have the correct password to enter the site"
    end
  end

end