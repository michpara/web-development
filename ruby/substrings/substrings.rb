def substrings(word, dictionary)
	substrings = {}
	dictionary.each do |elem|
		count = word.downcase.scan(/(?=#{elem})/).count
		if(count > 0)
			substrings[elem] = count
		end
	end
	puts substrings
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)