def translate(word)
	arrayOfWord = word.split(' ')
	translatedArray = []
	translatedWord = ""
	vowels = ['a', 'e', 'i', 'o', 'u']
	j = 0
	loop do
		if vowels.include? arrayOfWord[j][0]
			translatedWord = arrayOfWord[j] + "ay"
		else
			i = 0
			loop do
				if vowels.include? arrayOfWord[j][i] and (arrayOfWord[j][i-1] != 'q' and arrayOfWord[j][i] != 'u')
					break
				end
				i+=1

			end
			translatedWord = arrayOfWord[j][i..-1]
			for i in 0...i
				translatedWord += arrayOfWord[j][i]
			end
			translatedWord += "ay"
		end
		translatedArray << translatedWord
		translatedWord = ""
		j+=1
		if(j == arrayOfWord.length)
			break
		end
	end
	return translatedArray.join(' ')
end 
