class Board
  
#repeated_permutation
#repeated_combination
#include?
#delete_at(index)
#each_index
#
#

  def read_board
  	["r", "r", "r", "r"]
  	#self.grid[$round - 1][1]
  end

  def output(prev_input)

	output = {
	  "1" => %w[r r r r],
	  "2" => %w[r r r w],
	  "3" => %w[r r w w],
	  "4" => %w[r w w w],
	  "5" => %w[w w w w],
	  "6" => %w[w w w],
	  "7" => %w[w w],
	  "8" => %w[w],
	  "9" => %w[r r r],
	  "10" => %w[r r],
	  "11" => %w[r],
	  "12" => %w[],
	  "13" => %w[r r r r],
	  "14" => %w[r r w],
	  "15" => %w[r w],
	  }

	output.each do |key, value|
	  if prev_input == value
	    print output.key(value)
	  end
	end
	  
  end

  def woutput

  	output = {
	  "1" => %w[r r r r],
	  "2" => %w[r r r w],
	  "3" => %w[r r w w],
	  "4" => %w[r w w w],
	  "5" => %w[w w w w],
	  "6" => %w[w w w],
	  "7" => %w[w w],
	  "8" => %w[w],
	  "9" => %w[r r r],
	  "10" => %w[r r],
	  "11" => %w[r],
	  "12" => %w[],
	  "13" => %w[r r r r],
	  "14" => %w[r r w],
	  "15" => %w[r w],
	  }

	output.each do |key, value|
	  if self == value
	    print output.key(value)
	  end
	end

  	self.all? { |element| element.to_s.empty? }
  end

end

