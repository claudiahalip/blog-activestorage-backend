class PostsController < ApplicationController

    def index
        posts = Post.all 
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        featured_image = rails_blob_path(post.featured_image)
        render json: {post: post, featured_image: featured_image}
    
    end

    def create 
    end
end
