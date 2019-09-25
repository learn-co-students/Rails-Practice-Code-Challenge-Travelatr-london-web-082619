class DestinationsController < ApplicationController

  def index
    @destinations = Destination.all.sort_by(&:name)
  end


  def show
    @destination = Destination.find(params[:id])
    @posts = @destination.posts.sort_by(&:updated_at)
    @featured_post = @posts.max_by(&:likes)
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :country)
  end
end
