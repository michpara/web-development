require './lib/caesar_cipher'

describe CaesarCipher do

	describe "#caesar_cipher" do
		it "shift by 5 letters" do
			caesar_cipher = CaesarCipher.new
			expect(caesar_cipher.caesar_cipher("hello", 5)).to eql("mjqqt")
		end

		it "shift by 0 letters" do
			caesar_cipher = CaesarCipher.new
			expect(caesar_cipher.caesar_cipher("hello", 0)).to eql("hello")
		end

		it "shift by 26 letters" do
			caesar_cipher = CaesarCipher.new
			expect(caesar_cipher.caesar_cipher("hello", 26)).to eql("hello")
		end

		it "shift by 5 letters with capitals" do
			caesar_cipher = CaesarCipher.new
			expect(caesar_cipher.caesar_cipher("Hello", 5)).to eql("Mjqqt")
		end

		it "shift multiple words" do
			caesar_cipher = CaesarCipher.new
			expect(caesar_cipher.caesar_cipher("Hello World", 5)).to eql("Mjqqt Btwqi")
		end

		it "shift multiple words with random non-letters" do
			caesar_cipher = CaesarCipher.new
			expect(caesar_cipher.caesar_cipher("Hello./23World", 5)).to eql("Mjqqt./23Btwqi")
		end

		it "shift word with letters that go from the end to the front of the alphabet" do
			caesar_cipher = CaesarCipher.new
			expect(caesar_cipher.caesar_cipher("Zebra", 5)).to eql("Ejgwf")
		end
	end
end