require 'test/unit'
require 'guessword'

class GuesswordTest < Test::Unit::TestCase
	def test_guess
		h =  Guessword.guess("****O","HELL")
		assert h.include?("HELLO")
	end
end

