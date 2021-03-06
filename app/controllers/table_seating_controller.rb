class TableSeatingController < ApplicationController
  def new
    if current_user.admin?
      @table_seating = TableSeating.new
    else
      redirect_to '/welcome'
    end
  end

  def create
    seating_method = params[:seating_method]
    guests = params[:guests].gsub("\r", "").split("\n")

    if seating_method == "Seat Every Other"
      table_arrangement = TableSeater.new(guests).arrange_every_other
    else
      table_arrangement = TableSeater.new(guests).arrange_every_third
    end

    @table_seating = TableSeating.create!(:table_seating => table_arrangement)
    redirect_to table_seating_path(@table_seating)
  end

  def show
    @table_seating = TableSeating.find(params[:id])
  end
end