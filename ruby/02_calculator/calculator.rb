def add(x, y)
	return x + y
end

def subtract(x, y)
	return x - y
end

def sum(x)
	sum = 0
	x.each do |i|
		sum += i
	end
	return sum
end

def multiply(x)
	total = 1
	x.each do |i|
		total *= i
	end
	return total
end

def power(x, y)
	return x**y
end

def factorial(n)
	if(n == 0)
		total = 0
	else
		total = 1
		while n != 0
			total *= n
			n-=1
		end
	end
	return total
end