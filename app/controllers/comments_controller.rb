class CommentsController < ApplicationController
	def create
				
		
		#params[:commented_by]=current_user.id
		params[:comment][:commented_by]=User.find(current_user.id).name
		@movie = Movie.find(params[:movie_id])
   		 @comment = @movie.comments.create(content)
    	redirect_to movie_path(@movie)

	end
	

	private
	def content
		params.require(:comment).permit(:comment, :commented_by)
	end

end
