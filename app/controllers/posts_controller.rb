class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update, :like]
  
  def index
    @posts = Post.all
  end

  def show
    @author = @post.blogger
    @destination = @post.destination
    @likes = @post.likes
  end

  def like
    @post.like
    @post.save
    redirect_to post_path(@post)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def delete
    Post.destroy{params[:id]}
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
