def mergesort(arr)
	if arr.length > 1
		m = (arr.length/2).floor
		l = arr[0..m-1]
		r = arr[m..arr.length]
		mergesort(l)
		mergesort(r)

		i = 0
		j = 0
		k = 0

		while i < l.length and j < r.length
			if l[i] < r[j]
				arr[k] = l[i]
				i += 1
			else
				arr[k] = r[j]
				j += 1
			end
			k += 1
		end

		while i < l.length
			arr[k] = l[i]
			i+= 1
			k += 1
		end

		while j < r.length
			arr[k] = r[j]
			j+=1
			k+=1
		end
	else
		return arr
	end
end