def echo(phrase)
	return phrase
end

def shout(phrase)
	return phrase.upcase
end

def repeat(*args)
	case args.size
	when 1	
		return "#{args[0]} " + "#{args[0]}"
	when 2
		return ("#{args[0]} "*args[1]).strip
	end
end

def start_of_word(word, index)
	return word[0..(index-1)]
end

def first_word(str)
	newStr = str.gsub(/\s+/m, ' ').strip.split(" ")
	return newStr[0]
end

def titleize(str)
	noCap = ['a', 'an', 'the', 'for', 'and', 'nor', 'but', 'or', 'yet', 
		'so', 'at', 'around', 'by', 'after', 'along', 
		'from', 'of', 'on', 'to', 'with', 'without', 'over']
	ind = 0
	newstr = str.split
	newstr.each do |i|
		if noCap.include? i and ind > 0
			newstr[ind] = i
			ind = ind + 1
		else
			newstr[ind] = i.capitalize
			ind = ind + 1
		end
	end
	finalstr = newstr.join(" ")
	return finalstr
end