def fibs(n)
	j = 0
	k = 1
	(1..n).each do |i|
		puts j
		temp = k + j
		j = k
		k = temp
	end
end

def fibs_rec(n, seq)
	if n < 2 
		return seq
	else
		elem = seq[-1] + seq[-2]
		seq << elem
		fibs_rec(n-1, seq)
	end
end