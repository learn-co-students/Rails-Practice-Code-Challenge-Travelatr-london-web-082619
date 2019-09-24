class DestinationsController < ApplicationController
before_action :set_destination!, only: [:show, :edit, :update]
  
  def index
    @destinations = Destination.all
  end

  def show
    @posts = @destination.posts
    @featured = @posts.max_by{ |post| post.likes }
    @bloggers = @destination.bloggers
    @average_blogger_age = @bloggers.sum{ |blogger| blogger.age }.to_f / @bloggers.length
    @top_five_posts = @posts.order(id: :desc).limit(5)
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination.valid?
      @destination.save
      redirect_to destination_path(@destination)
    else
      render :new
    end
  end

  def update
    if @destination.update(destination_params)
      redirect_to destination_path(@destination)
    else
      render :edit
    end
  end

  def delete
    Destination.destroy{params[:id]}
    redirect_to destinations_path
  end

  private

  def destination_params
    params.require(:destination).permit(:name, :country)
  end

  def set_destination!
    @destination = Destination.find(params[:id])
  end
end
