module Mastermind
  class Ai

  	attr_reader :name, :avalible_numbers, :total_codes
  	def initialize()
  	  @name = Skynet
  	  @avalible_numbers = %w[1 2 3 4 5 6]
      @total_codes = $colors.repeated_permutation(4).to_a
  	end
  
#repeated_permutation
#repeated_combination
#include?
#delete_at(index)
#each_index
#
#
	
    def output(array)

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
	    if array == valuesf
	      next_move(output.key(value))
	    else
		  "nie znaleziono wyniku w bazie - blad"
	    end
	  end

	  def next_move(num)

	    if num == 15
	  	  %w[3 3 4 4]
	    end


	  end

    end

  end
end

