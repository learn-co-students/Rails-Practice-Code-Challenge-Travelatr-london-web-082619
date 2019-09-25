class PostsController < ApplicationController

    def index
        @posts = Post.all 
    end

    def show
        @post = Post.find(params[:id])
        
        end

    def new
        @posts = Post.new
    end

    def create
        @posts = Post.new(posts_params)

        if @posts.valid?
        @posts.save
     
        redirect_to posts_path
        else 
        render :new
        end
    end

   

    def edit
    @posts = Post.find(params[:id])
    end

    def update
        @posts = Post.find(params[:id])

        @posts.update(posts_params)

        redirect_to post_path(@posts)
    end

    def destroy 
    end 

    private

    def posts_params

    params.require(:post).permit(:name, :content, :blogger_id, :destination_id)

    end

end