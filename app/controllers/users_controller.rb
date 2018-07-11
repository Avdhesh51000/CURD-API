class UsersController < ApplicationController
	$new_otp=""
	def index


	end

	def abc
		binding.pry
		if  params[:user][:otp]==$new_otp.to_s#User.find(params[:id]).otp
			redirect_to users_path
		else
			@user=User.find(params[:id])
			@user.destroy
			redirect_to user_path
		end

	end

	def new
		@users=User.new
	end

	def show
	   @users=User.find(params[:id])
	end


	def create
		@users=User.new(content)
         $new_otp = Random.rand(1000..9999)
		if @users.save
	   client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      # Create and send an SMS message
        client.api.account.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @users.mobile_no,
        body: "Thanks for signing up. To verify your account, Please Verify the Otp: #{$new_otp}  ."
      )

     	redirect_to user_path(@users)

		else
			render :new
		end
	end

	private
	def content
		params.require(:users).permit(:name, :mobile_no, :password)
		
	end


end
