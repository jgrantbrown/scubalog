class DivesController < ApplicationController

def index
  @dives = Dive.all
end

def new
  @dive=Dive.new
  # Need to find the diver who sent request to add a dive. params passed from link?
  @diver= Diver.find(params[:diver_id])
  @dives=Dive.where(diver_id: params[:diver_id])
end

def show
  # showing wrong dive. needs to match diver_id to dive
  @dive=Dive.find(params[:id])
  
end

def create
  @dive = Dive.create(dive_params)
  redirect_to dives_path(@dive)
end

private
    def dive_params
      params.require(:dive).permit(:dive_number,:date,:location,:time_in,:time_out,:psi_start,:psi_end,:weight,:visibility,:computer,:air_temp,:surface_temp,:bottom_temp,:comments,:dive_time,:diver_id)
    end

end
