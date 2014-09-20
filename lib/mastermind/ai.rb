module Mastermind
  class Ai

  	attr_reader :name, :avalible_numbers, :total_codes
  	def initialize()
  	  @name = "Hal 9000"
  	  @avalible_numbers = %w[1 2 3 4 5 6]
      @total_codes = $colors.repeated_permutation(4).to_a
      @correct_numbers = []
      @possible_numbers = []
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
	    "1" => %w[],
		"2" => %w[w],
		"3" => %w[w w],
		"4" => %w[w w w],
		"5" => %w[w w w w],
		"6" => %w[r],
		"7" => %w[r r],
		"8" => %w[r r r],
		"9" => %w[r w],
	    "10" => %w[r w w],
	    "11" => %w[r w w w],
		"12" => %w[r r w],
		"13" => %w[r r w w],
	    }


	  output.each do |key, value|
	    if array.inspect == value.inspect
	      match = value
	    end
	  end

	  if match != ""
	  	output.key(match)
	  else
	  	puts "nie znaleziono wyniku w bazie - blad"
	  end
	end

	def histogram(array)
	  frequencies = Hash.new(0)
	  array.each { |number| frequencies[number] += 1 }
	  frequencies
	end

	def evaluation(last_move, num)
	  bad_code = []

	  case
	  when num = 1
	    @avalible_numbers -= last_move
	    @total_codes = @avalible_numbers.repeated_permutation(4).to_a
	  when num = 2
	  	if last_move.uniq.length == last_move.length
		  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  #duplicated = array.select{|element| array.count(element) > 1 }
		  #duplicated.uniq!
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 1
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
		end
		@total_codes -= bad_code
	  when num = 3
	  	if last_move.uniq.length == last_move.length
		  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 2
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
		end
		@total_codes -= bad_code
	  when num = 4
	  	if last_move.uniq.length == last_move.length
	  	  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 3
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		   	if value == 3
		   	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code <= 2
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
	  	end
	  	@total_codes -= bad_code
	  when num = 5
	  	@avalible_numbers = last_move
	    @total_codes = @avalible_numbers.repeated_permutation(4).to_a
	  when num = 6
	  	if last_move.uniq.length == last_move.length
		  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  #duplicated = array.select{|element| array.count(element) > 1 }
		  #duplicated.uniq!
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 1
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
		end
		@total_codes -= bad_code
	  when num = 7
	  	if last_move.uniq.length == last_move.length
		  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  #duplicated = array.select{|element| array.count(element) > 1 }
		  #duplicated.uniq!
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 2
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
		end
		@total_codes -= bad_code
	  when num = 8
	  	if last_move.uniq.length == last_move.length
	  	  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 3
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		   	if value == 3
		   	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code <= 2
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
	  	end
	  	@total_codes -= bad_code
	  when num = 9
	  	if last_move.uniq.length == last_move.length
		  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  #duplicated = array.select{|element| array.count(element) > 1 }
		  #duplicated.uniq!
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 2
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
		end
		@total_codes -= bad_code
	  when num = 10
	  	if last_move.uniq.length == last_move.length
	  	  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 3
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		   	if value == 3
		   	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code <= 2
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
	  	end
	  	@total_codes -= bad_code
	  when num = 11
	  	@avalible_numbers = last_move
	    @total_codes = @avalible_numbers.repeated_permutation(4).to_a
	  when num = 12
	  	if last_move.uniq.length == last_move.length
	  	  #nie ma powtórzeń
		  @total_codes.each do |element|
		  	element.each do |digit|
		  	  unless last_move.include?(digit)
		  	    bad_code += element
		  	  end
		  	end
		  end
		else
		  #sa powtórzenia
		  histogram = histogram(last_move)
		  histogram.each do |key, value|
		  	if value > 3
		  	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code >= value
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		   	if value == 3
		   	  @total_codes.each do |element|
		  	    element.each do |digit|
		  	      if digit == key
		  	      	keys_in_code += 1
		  	      end
		  	    end
		  	    if keys_in_code <= 2
		  	      bad_code += element
		  	    end
		  	  end
		   	end
		  end
	  	end
	  	@total_codes -= bad_code
	  when num = 13
	  	@avalible_numbers = last_move
	    @total_codes = @avalible_numbers.repeated_permutation(4).to_a
	  else
		puts "blad evaluation"
	  end

	end


	def next_move

	  if $round == 0
        %w[1 1 2 2]
      elsif $round == 1
      	%w[3 3 4 4]
      else
        proposal = @total_codes.sample
      end  
	end

  end
end

