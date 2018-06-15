class User < ApplicationRecord

	#before_validation :check_password

	has_secure_password

validates :email, uniqueness: true, presence: true, length: {minimum: 3}
validates :name, presence: true, length: {minimum: 3}
validates :password, presence: true




end
