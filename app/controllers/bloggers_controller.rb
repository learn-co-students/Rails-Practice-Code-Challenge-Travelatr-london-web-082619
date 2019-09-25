class BloggersController < ApplicationController

  def index
    @bloggers = Blogger.all.sort_by(&:name)
  end

  def new
    @blogger = Blogger.new
  end

  def show
    @blogger = Blogger.find(params[:id])
    @posts = @blogger.posts
    @featured_post = @posts.max_by(&:likes)

    @destinations = @blogger.destinations.uniq
    @ordered_destinations = @destinations.sort_by{|dest| dest.of_posts(@blogger).length}.reverse
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def create
    @blogger = Blogger.new(blogger_params)

    if @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def update
    @blogger = Blogger.find(params[:id])

    if @blogger.update(blogger_params)
      redirect_to blogger_path(@blogger)
    else
      render :edit
    end
  end

  def destroy
    Blogger.destroy(params[:id])
    redirect_to bloggers_path
  end


  private

  def blogger_params
    params.require(:blogger).permit(:name, :bio, :age)
  end
end
