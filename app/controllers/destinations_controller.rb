class DestinationsController < ApplicationController

  def show
    @destination = Destination.find(params[:id])
    @most_recent_posts = @destination.x_most_recent_posts(5)
    @featured_post = @destination.most_liked_post
  end

end