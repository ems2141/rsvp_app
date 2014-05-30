class TableSeatingController < ApplicationController
  def new
   # @table_seating = TableSeating.new
  end

  def create
    # take in which method to run in algo
    # take in the guest list to arrange seating for
    # convert guest names into an array of strings

    # run algo
    # algo returns an array of strings
    # figure out how to save an array of strings into db
    # TableSeating.create! from the output of the algo
    # redirect_to show
  end

  def show
    # @table_seating = TableSeating.find(params[:id])
  end

end