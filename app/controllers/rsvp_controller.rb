class RsvpController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create
    wedding_pass = params[:wedding_password]
    if wedding_pass == "ellieandnick2015"
      @user = User.create(name: params[:name], email: params[:email], password: params[:guest_password])
      if @user.valid?
        session[:user_id] = @user.id
        redirect_to '/welcome'
      else
        render 'new'
      end
    else
      redirect_to '/rsvp', notice: "I'm sorry but you do not have the correct password to enter the site"
    end
  end

end