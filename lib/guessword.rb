

class Guessword
	# Guess words by using patter and letters.
	#
	# Example:
	#   >> Guessword.guess("****o","hell")
	#   or 
	#   Using excute command
	#   >> guessword ****o hell
	#
	#   output: hello
	#
	#  Arguments:
	#    pattern_str: (String)
	#    letters_str: (String)
	#  Return:
	#    words: (Array)
	#
	def self.guess(pattern_str, letters_str)
    dict = Hash.new(false)
    File.open(File.join(File.dirname(__FILE__),'wordlist.txt'),'r').each_line do |word|
      dict[word.chop.upcase] = true
    end
		pattern  =  pattern_str.upcase.split('').to_a
		length = 0
		pattern_flag = false
		pattern.each do |x|
		  if x == '*'
		    length = length + 1
		  else
		    pattern_flag = true
		  end
		end
		letters = letters_str.upcase.split('').to_a
		size = letters.length
		total = size.downto(size - length + 1).inject(1) { |r,e| r * e }
		
		puts "Input:"
		puts "Pattern = #{pattern}"
		puts "Length  = #{length}"
		puts "Letters = #{letters.join}"
		puts "Size    = #{size}"
		puts "Total   = #{total}"
		puts "Expect time: #{total * 0.007} seconds"
		
		puts
		puts "Output:"
		words = []
		letters.permutation(length).entries.each do |y|
		    if pattern_flag
		      aword = []
		      pattern.each do |x|
		        if x == '*'
		          aword.push y.shift
		        else
		          aword.push x
		        end
		      end
		      word = aword.join
		    else
		      word = y.join
		    end
		    if not words.include?(word) and dict[word.upcase]
		      puts word
		      words << word 
		    end
		end
		
		puts "Total: #{words.length}/#{total}"
		words
	end
end

