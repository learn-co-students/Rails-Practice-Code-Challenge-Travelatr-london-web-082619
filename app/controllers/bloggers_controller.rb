class BloggersController < ApplicationController
  
  def new
    @blogger = Blogger.new
  end

  def create
    @blogger = Blogger.create(blogger_params)

    if @blogger.valid?
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
    @featured_post = @blogger.most_liked_post
    @top_5_destinations = @blogger.top_x_destinations(5)
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
  
end