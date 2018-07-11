class OperationsController < ApplicationController

	def new
		@operations=Operation.new
	end

	def index

		@operation=Operation.all

		#debugger

		# @operation.each do|f|

		# 	@a=((f.planed_end_date-f.actual_start_date)/(f.estimated_project_completion_date-f.actual_start_date)).to_i
		# 	@b= (f.estimated_effort.to_f/f.work_effort).round(4)

		# end


	end
	def create
		#debugger
		# if params[:operations][:assigned_issues]=="calculate" 
		# 	params[:operations][:output]= calculate
		# end
		@operation=Operation.new(content)
		if @operation.save
			redirect_to root_path
		else
			render :new
		end
				
	end

	private
	def content
		params.require(:operations).permit( :name , :milestone , :issuetitle , :work_effort , 
			:working_day , :estimated_effort_to_complete , :estimated_project_completion_date , 
			:planned_start_date , :planed_end_date , :actual_start_date , 
			:actual_end_date , :replanned_end_date , :estimated_effort )
	end


end
