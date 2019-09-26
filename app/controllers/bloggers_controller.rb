class BloggersController < ApplicationController

  def new
    @blogger = Blogger.new
  end

  def index
    @bloggers = Blogger.all
  end

  def show
    @blogger = Blogger.find(params[:id])
    @posts = @blogger.posts
    @post = @posts.max_by{ |post| post.likes}
  end

  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger.valid?
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def edit
    @blogger = Blogger.find(params[:id])
  end

  def update
    @blogger = Blogger.find(params[:id])
    @blogger.update(blogger_params)
    if @blogger.valid?
      redirect_to blogger_path(@blogger)
    else
      render :edit
    end
  end

  private

  def blogger_params
    params.require(:blogger).permit!
  end

end