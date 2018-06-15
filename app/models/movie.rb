class Movie < ApplicationRecord
	mount_uploader :image, ImageUploader

	has_many :comments, dependent: :destroy


validate :dislike , :dolike

	def dolike
		self.dislike=0;
		
	end
	validate :like , :checklike

	def checklike
		self.like=0;
		
	end
	
end
