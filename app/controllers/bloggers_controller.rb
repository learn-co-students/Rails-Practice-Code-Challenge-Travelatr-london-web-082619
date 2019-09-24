class BloggersController < ApplicationController
  before_action :set_blogger!, only: [:show, :edit, :update]
  
  def index
    @bloggers = Blogger.all
  end

  def show
    @posts = @blogger.posts
    @total_likes = @posts.sum(&:likes)
    @featured = @posts.max_by(&:likes)
  end

  def new
    @blogger = Blogger.new
  end

  def edit
  end

  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def update
    if @blogger.update(blogger_params)
      redirect_to blogger_path(@blogger)
    else
      render :edit
    end
  end

  def delete
    Blogger.destroy{params[:id]}
    redirect_to bloggers_path
  end

  private

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end

  def set_blogger!
    @blogger = Blogger.find(params[:id])
  end
end
