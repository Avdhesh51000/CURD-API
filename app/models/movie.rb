class Movie < ApplicationRecord
	mount_uploader :image, ImageUploader

	has_many :comments, dependent: :destroy

	has_many :likes, as: :likeable,  dependent: :destroy

	belongs_to :user

	
end
