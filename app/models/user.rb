class User < ApplicationRecord
	 validates :name, presence: true
     validates :mobile_no, presence: true, uniqueness: true
     # after_create :send_otp_notification

     # def send_otp_notification
     # 	# Instantiate a Twilio client
     
		
     # end
end
