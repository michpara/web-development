class Timer

	@seconds

	def seconds
		@seconds = 0
	end

	def seconds=integer
		@seconds = integer
	end

	def time_string
		hours = @seconds/3600
		minutes = (@seconds - hours*3600)/60
		seconds = (@seconds - hours*3600 - minutes*60)

		time_string = ""

		if hours < 10
			time_string += "0" + hours.to_s + ":"		
		else
			time_string += hours.to_s + ":"
		end


		if minutes < 10
			time_string += "0" + minutes.to_s + ":"		
		else
			time_string += minutes.to_s + ":"
		end


		if seconds < 10
			time_string += "0" + seconds.to_s 	
		else
			time_string += seconds.to_s 
		end

	end
end
