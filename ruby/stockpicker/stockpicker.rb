def stock_picker(days)
	max_difference = 0
	best_days = Array.new(2)
	for i in 0..days.length-1
		j = i+1  
		for j in j...days.length
			if (days[j] - days[i]) > max_difference
				max_difference = days[j] - days[i]
				best_days[0] = i
				best_days[1] = j
			end
		end
	end
	p best_days
end

stock_picker([17,3,6,9,15,8,6,1,10])