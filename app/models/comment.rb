class Comment < ApplicationRecord
	belongs_to :movie


	has_many :likes, as: :likeable, dependent: :destroy
	belongs_to :user

	#validate :commented_by, :fillme

	# def fillme
	# 	self.commented_by=current_user
	# end
end
