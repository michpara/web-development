def bubble_sort(array)
	count = 0
	while count != array.length-2 do
		count = 0
		for i in 0..array.length-2
			if array[i] > array[i+1]
				temp = array[i]
				array[i] = array[i+1]
				array[i+1] = temp
			else
				count = count + 1
			end
		end
	end
	p array
end

bubble_sort([4,3,78,2,0,2])