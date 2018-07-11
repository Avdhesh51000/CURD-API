class User < ApplicationRecord

	#before_validation :check_password

has_secure_password

has_many :movies ,dependent: :destroy
has_many :likes , dependent: :destroy
has_many :comments, dependent: :destroy


validates :email, uniqueness: true, presence: true, length: {minimum: 3}
validates :name, presence: true, length: {minimum: 3}
validates :password, presence: true




end
