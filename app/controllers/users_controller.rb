class UsersController < ApplicationController
	def index
		@users=User.all
	end

	def import

		CSV.foreach(file.path, headers: true, :header_converters => [:downcase]) do |row|
			User.check_row(row.to_h) if row.present?
			#User.create! row.to_hash
		end
		$count =0
		User.import(params[:file])

		redirect_to root_url ,notice: "Activity done"
	end
end
