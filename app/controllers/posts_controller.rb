class PostsController < ApplicationController

  def index
    @posts = Post.all.sort_by(&:title)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def delete
    Post.destroy(params[:id])
    redirect_to posts_path
  end

  def like
    @post = Post.find(params[:id])
    @post.like
    @post.save
    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :updated_at)
  end
end
