class UsersController < ApplicationController
	
	

	def index
	end

	def new
		@users=User.new
	end

	def show
		@users=User.find(params[:id])
	end



	def create
		@users=User.new(paramscontent)

		if @users.save
			redirect_to user_path(@users)
		else
			render :new
		end

	end

	private
	def paramscontent
		params.require(:users).permit(:name, :email, :password, :password_confirmation)
	end

	
end
