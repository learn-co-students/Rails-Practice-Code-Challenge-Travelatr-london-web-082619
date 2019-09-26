class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
  end

  private 

  def desintation_params
    params.require(:destination).permit!
  end
  
end
