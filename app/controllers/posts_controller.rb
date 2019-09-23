class PostsController < ApplicationController

  def new
    @post = Post.new
    @bloggers = Blogger.order(:name)
    @destinations = Destination.order(:name)
  end

  def create
    @post = Post.create(post_params)

    if @post.valid?
      redirect_to post_path(@post)
    else
      @bloggers = Blogger.order(:name)
      @destinations = Destination.order(:name)
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @blogger = @post.blogger
    @destination = @post.destination
  end

  def edit
    @post = Post.find(params[:id])
    @bloggers = Blogger.order(:name)
    @destinations = Destination.order(:name)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.valid?
      redirect_to post_path(@post)
    else
      @bloggers = Blogger.order(:name)
      @destinations = Destination.order(:name)

      render :edit
    end
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save

    redirect_to post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :likes,
      :blogger_id,
      :destination_id
    )
  end

end