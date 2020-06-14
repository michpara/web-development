def caesar_cipher(text, shift)
	alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
		'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z']

	array = text.split("")

	for i in 0...array.length-1
		char = array[i].downcase
		if(alphabet.include?(char))
			newIndex = alphabet.index(char) + shift
			if(newIndex > 26)
				newIndex = newIndex%26
			end
			array[i] == char ? array[i] = alphabet[newIndex] : array[i] = alphabet[newIndex].upcase
		end
	end
	
	text = array.join("")
	
	puts text
end

caesar_cipher("What a string!", 5)