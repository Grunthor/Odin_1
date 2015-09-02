class CaesarCipher
    def self.encrypt(str, key)
	
        letters = str.split("")
		
        if key > 26
            key %= 26 
        elsif key < 0
            key = -((key).abs%26)
        end
        letters = letters.map! do |letter|
		
			if((letter.ord >=65) && (letter.ord<=90))
				flag = 1
			elsif((letter.ord >=97) && (letter.ord<=122))
				flag = 2
			end
			if((letter.ord >= 32) && (letter.ord<65))
				letter
            else
				letter = letter.ord + key
				if(flag == 1)
					if ((letter > 90) && (letter < 97))  
						letter = 64 + letter - 90
					elsif ((letter < 65) && (letter > 32))  
						letter = 91 - (65 - letter)
					else
						letter
					end
				elsif(flag == 2)
					if (((letter > 122) && (letter < 126)))  
						letter = 96 + letter - 122
					elsif ((letter < 97) && (letter > 90))  
						letter = 123 - (97 - letter)
					else 
						letter
					end
				end
			end
			letter.chr
		end
		puts letters.join("")
    end
end

# CaesarCipher.encrypt("What a string!",5) #=> "Bmfy f xywnsl!"


