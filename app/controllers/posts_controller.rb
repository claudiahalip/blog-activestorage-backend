class PostsController < ApplicationController

    def index
        posts = Post.all.with_attached_featured_image 
        render json: posts.map { |post| 
            post.as_json.merge({ image: url_for(post.featured_image) })    
        }

        #render json: posts.to_json(include: {featured_image_attachment: {include: :blob}})
    end

    def show
        post = Post.find(params[:id])
        featured_image = rails_blob_path(post.featured_image)
        url = url_for(post.featured_image) 
        render json: {post: post, featured_image: featured_image, url: url}
    end

    def create 
        post = Post.create(title: params[:post][:title], content: params[:post][:content])
        render json: post
    end

    def update 
        post = Post.find(params[:id])
        post.update(featured_image: params[:featured_image])
        featured_image_url = rails_blob_path(post.featured_image)
         
        render json: {post: posts, featured_image: featured_image_url}

        
    end
end
