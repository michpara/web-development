class Book
	attr_accessor :title

	def title
		words_no_cap = ["and", "or", "the", "over","to", "the", "a", "but", 
		"in", "of", "an"]
		words = @title.split(" ").map{|word|
			if words_no_cap.include?(word)
				word
			else
				word.capitalize
			end
		}.join(" ")
		words[0] = words[0].capitalize
		return words
	end	
end
