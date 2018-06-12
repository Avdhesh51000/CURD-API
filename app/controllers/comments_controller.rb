class CommentsController < ApplicationController

	def index
    @comments = Comment.all

    render json: @comments
  end
 
  
  def create



    @comment = Comment.new(comment: params[:comment],post_id: params[:post_id]) 
    if @comment.save
    	render json: @comment
      
    else
      render json: {error: 'process not completed'}
    end
  end
 
  def update
    @comment = Comment.find(params[:id])
 
    if @comment.update(comment: params[:comment],post_id: params[:post_id])
      render json: @comment
    else
      ender json: {error: 'process not completed'}
    end
  end
 
  def destroy
    @comment = Comment.find(params[:id])
    
    if @comment.destroy
            render json: {status: 'successful'}
        else
            render json: {error: 'process not completed'}
        end
  end
 

end
