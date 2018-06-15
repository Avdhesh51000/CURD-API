class Comment < ApplicationRecord
	belongs_to :movie

	#validate :commented_by, :fillme

	# def fillme
	# 	self.commented_by=current_user
	# end
end
