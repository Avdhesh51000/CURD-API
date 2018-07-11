class MoviesController < ApplicationController
	def home

	end

	def index
		@movies=Movie.all
	end

	def new
		@movies=Movie.new
	end

	def show
				
		@movies=Movie.find(params[:id])
				
	end

	def like_me
		@movies=Movie.find(params[:id])
		@movies.like+=1
		if @movies.update_attribute(:like,@movies.like)
		redirect_to movies_path
		else
		redirect_to movies_path
		end

	end

	def dislike_me
		@movies=Movie.find(params[:id])
		@movies.dislike+=1
		if @movies.update_attribute(:dislike,@movies.dislike)
		redirect_to movies_path
		else
		redirect_to movies_path
		end

	end

	def create 
    # build a photo and pass it into a block to set other attributes
    	@movies = Movie.new(content_params) do |t|
    	
      if params[:movies][:mdata]
        t.mdata      = params[:movies][:mdata].read
        t.mfilename  = params[:movies][:mdata].original_filename
        t.mime_type = params[:movies][:mdata].content_type
      end
  end
		if @movies.save
		      redirect_to movie_path(@movies)
		else
		      render :new
		end
	

    end

def serve
	
    @movies = Movie.find(params[:movie_id])
    @movies.image.thumb
    send_data(@movies.mdata, :type => @movies.mime_type, :mfilename => "#{@movies.mname}.jpg", :disposition => "inline")
  end

 

    private
    def content_params
    	params.require(:movies).permit(:mname,:mdata)

	end

end
