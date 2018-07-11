class User < ApplicationRecord

	validates :name, presence: true
	validates :step, presence: true
	validates :var1, presence: true

	require 'csv'

	$count =0
	$a=[]

	def self.import(file)

		
	end

	def self.check_row(row)
		$count = $count+1
         if row.key?("name") && row.key?("step") && row.key?("var1") && row["name"].present? && row["step"].present? && row["var1"].present?
         		if User.find_by(name: row["name"]).present? 
     			    User.where(name: row["name"]).update row
     		else 

     			User.create! row 
     			
     		end
     			#notice: "Insertion done"  	
          else
          		$a<<$count
            	#notice: "Inavalid data"
          end
		
	end


end
