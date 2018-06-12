class PostsController < ApplicationController

	def index
    @posts = Post.all

    render json: @posts
  end
 def create

   

    @post = Post.new(title: params[:title], text: params[:text])
 
    if @post.save
    	render json: @post
      
    else
      render json: {error: 'process not completed'}
    end
  end
 
  def update
  	    @post = Post.where(id: params[:id])
 
    if @post.update(title: params[:title], text: params[:text])
      render json: @post
    else
      render json: {error: 'process not completed'}
    end
  end
 
  def destroy
  	
    @post = Post.find(params[:id])
    #@post.destroy
 
    if @post.destroy
            render json: {status: 'successful'}
        else
            render json: {error: 'process not completed'}
        end
  end

end
