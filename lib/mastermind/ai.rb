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
=begin	
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
=end
	def histogram(array)
	  frequencies = Hash.new(0)
	  array.each { |number| frequencies[number] += 1 }
	  frequencies
	end

	def create_groups(move, feedback)
	  @correct_codes = []
	  h_feedback = histogram(feedback)

	  if feedback.length > 0
	  	puts "ruch to #{move}"
	  	puts "feedback wynosi #{feedback.length} - #{feedback}"

		groups = move.combination(feedback.length).to_a
		if groups.uniq.length != groups.length
		  groups.uniq!
		end
		puts "liczba kombinacji wynosi #{groups.length}"
		print groups
		@total_codes.each do |code|
		  groups.each do |guess|
		    if (guess - code).empty?
		      @correct_codes.push(code)
		    end
		  end
		end
		@total_codes = @correct_codes.uniq!
	  elsif feedback == nil
	  	@total_codes.each do |element|
		  element.each do |digit|
		  	if move.include?(digit)
		  	  @bad_code.push(element)
		  	end
		  end
		end
		@bad_code.push(move)
		if @bad_code.uniq.length != @bad_code.length
		  @bad_code.uniq!
		  @total_codes = @total_codes - @bad_code
		else
		  @total_codes = @total_codes - @bad_code
		end

	  end


	  if h_feedback.has_key?("r")
	  	@correct_codes = []
	  	c = h_feedback["r"]

	  	case c
	    when 1
	    puts "1"
	  	@total_codes.each do |code|	
	  	  code.each_with_index do |color, index|
            if move[index] == code[index]
              @correct_codes.push(code)
            end
          end
        end
        puts @correct_codes.count
        @total_codes = @correct_codes.uniq!
        @total_codes.include?(["1", "2", "3", "4"])	
        when 2
          puts "2"
          groups_r = [["x", "x", move[2], move[3]], [ move[0], "x", "x", move[3]], [ move[0], move[1], "x", "x"], ["x", move[1], move[2], "x"], ["x", move[1], "x", move[3]], [ move[0], "x", move[2], "x"]]
          @total_codes.each do |code|	
	  	    code.each_with_index do |color, index|
  	    	  groups_r.each do |gcode|
  	    	    gcode.each_with_index do |gcolor, gindex|
                  if gcode[gindex] == code[gindex]
                    @correct_codes.push(code)
                  end
                end
              end
            end
          end
          if @correct_codes.uniq.length != @correct_codes.length
            @total_codes = @correct_codes.uniq!
          else
          	@total_codes = @correct_codes
            @total_codes.include?(["1", "2", "3", "4"])
          end

        when 3
          puts "3"
          groups_r = [["x", move[1], move[2], move[3]], [ move[0], "x", move[2], move[3]], [ move[0], move[1], move[2], "x"], [move[0], move[1], "x", move[3]]]
          @total_codes.each do |code|	
	  	    code.each_with_index do |color, index|
  	    	  groups_r.each do |gcode|
  	    	    gcode.each_with_index do |gcolor, gindex|
                  if gcode[gindex] == code[gindex]
                    @correct_codes.push(code)
                  end
                end
              end
            end
          end
          if @correct_codes.uniq.length != @correct_codes.length
            @total_codes = @correct_codes.uniq!
          else
          	@total_codes = @correct_codes
            @total_codes.include?(["1", "2", "3", "4"])
          end
        else
		  puts "blad evaluation create_groups"
	  	end
	  end
	end

=begin
	def definicja(move, num)
	  @bad_code = []
	  

	  puts "rozpoczynam wycinanie lych kodow"

	  if move.uniq.length == move.length
	  	puts "nie ma powtorzen w kodzie"
		#nie ma powtórzeń
		@total_codes.each do |element|
			#puts "element #{element}"
		  element.each do |digit|
		  	#puts "       cyfra #{digit}"
		  	unless move.include?(digit)
		  	  #zmiana 1
		  	  #puts "opcja 1 element #{element} zostanie dodany do zlych kodow"
		  	  @bad_code.push(element)
		  	else
		  	  #puts "opcja 1 element #{element} nie zostanie dodany do zlych kodow"
		  	end
		  end
		end
	  else
	  	puts "sa powtorzenia w kodzie"
		#sa powtórzenia
	    histogram = histogram(move)
	    histogram.each do |key, value|
		  if value.to_i > num
		  	@total_codes.each do |element|
		  		keys_in_code = 0
		  		#puts "element #{element}"
		  	  element.each do |digit|
		  	  	#puts "       cyfra #{digit}"
		  	    if digit == key
		  	      #puts "       cyfra #{digit} == #{key}"
		  	      keys_in_code += 1
		  	      #puts "keys_in_code = #{keys_in_code}"
		  	    end
		  	  end
		  	  if keys_in_code >= value.to_i
		  	  	#puts "#{keys_in_code} jest wieksze od #{value.to_i}"
		  	  	#puts "opcja 2 element #{element} zostanie dodany do zlych kodow"
		  	    @bad_code.push(element)
		  	  end
		  	end
		  else
		  	puts "nie ma w histogramie (#{histogram} wartosci wiekszych num(#{num})"
		  end
		end
	  end
	  @bad_code.push(move)
	  if @bad_code.uniq.length != @bad_code.length
	  	puts "sa powtorzenia w zlych kodach"
		#zmiana 2
		return @bad_code.uniq!
	  else
	  	puts "nie ma powtorzen w zlych kodach"
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
		  	  #puts "opcja 1 element #{element} zostanie dodany do zlych kodow"
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
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 1) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"
	  	
	  when "3"
	  	puts "wypadl numer #{num}"
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 2) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"
	  	
	  when "4"
	  	puts "wypadl numer #{num}"
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 3) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"
	  	
	  when "5"
	  	puts "wypadl numer #{num}"
	  	@total_codes = last_move.permutation(4).to_a

	  	#@total_codes.each do |element|
		#  element.each do |digit|
		#  	unless last_move.include?(digit)
		#  	  @bad_code.push(element)
		#  	  puts "opcja 1 element #{element} zostanie dodany do zlych kodow"
		#  	end
		#  end
		#end
		#@bad_code.push(last_move)
		#if @bad_code.uniq.length != @bad_code.length
		#  @bad_code.uniq!
		#  @total_codes = @total_codes - @bad_code
		#else
		#  @total_codes = @total_codes - @bad_code
		#end
	  	
	  when "6"
	  	puts "wypadl numer #{num}"
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 1) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"
	  	
	  when "7"
	  	puts "wypadl numer #{num}"
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 2) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"
	  	
	  when "8"
	  	puts "wypadl numer #{num}"
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 3) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"

	  when "9"
	  	puts "wypadl numer #{num}"
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 2) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"

	  when "10"
	  	puts "wypadl numer #{num}"
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 3) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"
	  	
	  when "11"
	  	puts "wypadl numer #{num}"
	  	@total_codes = last_move.permutation(4).to_a
	  	
	  when "12"
	  	puts "wypadl numer #{num}"
	  	puts "tworze histogram ruchu #{last_move}"
	  	h = histogram(last_move)
	  	puts "histogram ruchu #{last_move} = #{h}"
	  	b = definicja(last_move, 3) # liczba 2, poniewaz sa dwie trafione cyfry w tej opcji"
	  	puts "zlych kodow jest = #{b.count}"
	  	puts "Total codes = #{@total_codes.count} przed wycieciem. WYCINAM!"
	  	@total_codes = @total_codes - b
	  	puts "Total codes = #{@total_codes.count} po wycieciu"
	  	
	  when "13"
	  	puts "wypadl numer #{num}"
	  	@total_codes = last_move.permutation(4).to_a
	  	
	  else
		puts "blad evaluation"
	  end

	end
=end

	def next_move

	  if $round == 0
        %w[1 1 2 2]
      elsif $round == 1
      	%w[3 3 4 4]
      elsif $round == 2
      	%w[5 5 6 6]
      else
        @total_codes.sample
      end  
	end

  end
end

