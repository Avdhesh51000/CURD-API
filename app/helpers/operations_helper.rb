module OperationsHelper
 
  def method(ped,psd,ecd)
    ((ped-psd)/(ecd-psd)).to_i
  end

  def method2(ee,ff)
    (ee.to_f/ff).round(4)
  end


	$count={}
	$estimateeffort={}
	
		def abc(a)
			
			b=a.dup
			b[0].work_effort=nil
			latestdate=Date.today

			a.each_with_index do|i , index|

				if $count[i.email] == nil
					$count[i.email]=i.work_effort
					$estimateeffort[i.email]=i.estimated_effort
					latestdate=i.working_day
				end	

				j=index+1
				
				for j in j...a.length do 	 
					if  b[j].work_effort != nil && i.name == b[j].name && i.milestone_title == b[j].milestone_title && i.issue_title == b[j].issue_title && i.email == b[j].email
								$count[i.email] = $count[i.email]+b[j].work_effort
								if i.working_day < b[j].working_day && latestdate < b[j].working_day
									latestdate = b[j].working_day
									$estimateeffort[i.email]=b[j].estimated_effort
								end
								b[j].work_effort=nil				
						
					end
				
				end

			end
		end

		def lets(a)

		a.each do |p|
			puts p.name
		end
	end


end


