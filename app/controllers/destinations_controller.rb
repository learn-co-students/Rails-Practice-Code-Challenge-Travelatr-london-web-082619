class DestinationsController < ApplicationController

    def index
        @destinations = Destination.all
    end

    def show
        @destination = Destination.find(params[:id])
        @destination_posts = Post.all.select{ |post| post.destination == @destination }
    end

end
