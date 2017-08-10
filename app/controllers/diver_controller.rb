class DiverController < ApplicationController

  def show
    @diver = Diver.find(params[:id])
    @dives = Dive.all
  end

  def create
  end

  def index
    @divers=Diver.all
  end

end


# FInd diver_id = params[:id] to get all dives for this diver
# @dives= Dive.find()
