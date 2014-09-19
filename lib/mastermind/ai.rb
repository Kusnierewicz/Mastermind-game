module Mastermind
  class Ai

  	attr_reader :name, :avalible_numbers, :total_codes
  	def initialize()
  	  @name = "Hal 9000"
  	  @avalible_numbers = %w[1 2 3 4 5 6]
      @total_codes = $colors.repeated_permutation(4).to_a
      @correct_numbers = []
      @possible_numbers = @avalible_numbers
  	end
  
#repeated_permutation
#repeated_combination
#include?
#delete_at(index)
#each_index
#
#
	
    def doutput(array)
      if $round == 0
      	print "koniec"
      	return
      end
      match = ""

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
	    if array.inspect != value.inspect
	  	  match = ""
	    else
	      match = value
	    end
	  end

	  if match != ""
	  	output.key(match)
	  else
	  	puts "nie znaleziono wyniku w bazie - blad"
	  end
	end

	def evaluation(last_move, num)

	end


	def next_move(num)

	  if $round == 0
        %w[1 1 2 2]
      elsif $round == 1
      	%w[3 3 4 4]
      else
      	proposal = []
        4.times do 
          proposal.push($colors.sample)
        end
        proposal
      end  
	end

  end
end

