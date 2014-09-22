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
      	puts "runda 0 czyli brak output'u"
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

	def cut(move, num)
	  @bad_code = []
	  print "start cut_codes"

	  if move.uniq.length == move.length
		#nie ma powtórzeń
		@total_codes.each do |element|
		  element.each do |digit|
		  	unless move.include?(digit)
		  	  #zmiana 1
		  	  @bad_code.push(element)
		  	end
		  end
		end
	  else
		#sa powtórzenia
	    histogram = histogram(move)
	    histogram.each do |key, value|
		  if value > num
		  	@total_codes.each do |element|
		  	  element.each do |digit|
		  	    if digit == key
		  	      keys_in_code += 1
		  	    end
		  	  end
		  	  if keys_in_code >= value
		  	    @bad_code.push(element)
		  	  end
		  	end
		  end
		end
	  end
	  @bad_code.push(last_move)
	  if @bad_code.uniq.length != @bad_code.length
		#zmiana 2
		return @bad_code.uniq!
	  else
	  	@bad_code
	  end
	end

	def evaluation(last_move, num)
	  @bad_code = []
	  keys_in_code = 0

	  case num
	  when "1"
	  	puts "wypadl numer #{num}"
	  	@total_codes.each do |element|
		  element.each do |digit|
		  	if last_move.include?(digit)
		  	  @bad_code.push(element)
		  	end
		  end
		end
		@bad_code.push(last_move)
		if @bad_code.uniq.length != @bad_code.length
		  @bad_code.uniq!
		  @total_codes = @total_codes - @bad_code
		else
		  @total_codes = @total_codes - @bad_code
		end

	  when "2"
	  	puts "wypadl numer #{num}"
	  	
	  when "3"
	  	puts "wypadl numer #{num}"
	  	
	  when "4"
	  	puts "wypadl numer #{num}"
	  	
	  when "5"
	  	puts "wypadl numer #{num}"
	  	
	  when "6"
	  	puts "wypadl numer #{num}"
	  	
	  when "7"
	  	puts "wypadl numer #{num}"
	  	
	  when "8"
	  	puts "wypadl numer #{num}"
	  	
	  when "9"
	  	puts "wypadl numer #{num}"
	  	h = histogram(last_move)
	  	puts h
	  	b = cut(last_move, 2) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts b


	  	#if last_move.uniq.length == last_move.length
		#  #nie ma powtórzeń
		#  @total_codes.each do |element|
		#  	element.each do |digit|
		#  	  unless last_move.include?(digit)
		# 	  	#zmiana 1
		#  	    puts @bad_code.push(element)
		#  	  end
		#  	end
		#  end
		#else
		#  #sa powtórzenia
		#  histogram = histogram(last_move)
		#  histogram.each do |key, value|
		#  	if value > 2
		#  	  @total_codes.each do |element|
		#  	    element.each do |digit|
		#  	      if digit == key
		#  	      	keys_in_code += 1
		#  	      end
		#  	    end
		#  	    if keys_in_code >= value
		#  	      @bad_code.push(element)
		#  	    end
		#  	  end
		#   	end
		#  end
		#end
		#@bad_code.push(last_move)
		#if @bad_code.uniq.length != @bad_code.length
		#  #zmiana 2
		#  @bad_code.uniq!
		#  @total_codes = @total_codes - @bad_code
		#else
		#  @total_codes = @total_codes - @bad_code
		#end
	  when "10"
	  	puts "wypadl numer #{num}"
	  	
	  when "11"
	  	puts "wypadl numer #{num}"
	  	
	  when "12"
	  	puts "wypadl numer #{num}"
	  	
	  when "13"
	  	puts "wypadl numer #{num}"
	  	
	  else
		puts "blad evaluation"
	  end

	end


	def next_move

	  if $round == 0
        %w[1 1 2 2]
      elsif $round == 1
      	%w[3 3 4 4]
      elsif $round == 2
      	%w[5 5 6 6]
      else
        proposal = @total_codes.sample
      end  
	end

  end
end

