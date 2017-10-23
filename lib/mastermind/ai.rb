module Mastermind
  class Ai

  	attr_reader :name, :avalible_numbers, :total_codes
  	def initialize()
  	  @name = 'HAL 9000'
  	  @avalible_numbers = %w[1 2 3 4 5 6]
      @total_codes = $colors.repeated_permutation(4).to_a
      @correct_numbers = []
      @possible_numbers = []
  	end

	def histogram(array)
	  frequencies = Hash.new(0)
	  array.each { |number| frequencies[number] += 1 }
	  frequencies
	end

	def code_eater(move, feedback)
	  @correct_codes = []
	  h_feedback = histogram(feedback)
      @total_codes -= move
	  if feedback.length > 0
	  	#puts "wersja 0"
	  	#puts "kodow do iteracji jest #{@total_codes.count}"

		groups = move.combination(feedback.length).to_a
		if groups.uniq.length != groups.length
		  groups.uniq!
		end

        @total_codes.delete(move)
        #puts "kodow do iteracji jest #{@total_codes.count}"
		@total_codes.each do |code|
		  groups.each do |guess|
		    if (guess - code).empty?
		      @correct_codes.push(code)
		    end
		  end
		end
		if @correct_codes.uniq.length != @correct_codes.length
          #puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
          @total_codes = @correct_codes.uniq!
        else
          #puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
          @total_codes = @correct_codes
        end

	  elsif feedback == [] && $round > 0
	  	@bad_code = []
	  	#puts "feedback == []"
	  	#puts "kodow do iteracji jest #{@total_codes.count}"
	  	@total_codes.delete(move)

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
		  #puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
		  @total_codes = @total_codes - @bad_code
		else
		  #puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
		  @total_codes = @total_codes - @bad_code
		end
		#puts "kodow do iteracji jest #{@total_codes.count}"
	  end

	  if h_feedback.has_key?('r')
	  	@correct_codes = []
	  	c = h_feedback['r']

	  	case c
	    when 1
	      #puts "jest 1 r w feedbacku"
	      #puts "kodow do iteracji jest #{@total_codes.count}"

	  	  @total_codes.each do |code|
	  	    code.each_with_index do |color, index|
              if move[index] == code[index]
                @correct_codes.push(code)
              end
            end
          end

          if @correct_codes.uniq.length != @correct_codes.length
            #puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
            @total_codes = @correct_codes.uniq!
          else
            #puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
            @total_codes = @correct_codes
          end

        when 2

          #puts "sa 2 r w feedbacku"
          #puts "kodow do iteracji jest #{@total_codes.count}"
          groups_r = [['x', 'x', move[2], move[3]], [ move[0], 'x', 'x', move[3]], [ move[0], move[1], 'x', 'x'], ['x', move[1], move[2], 'x'], ['x', move[1], 'x', move[3]], [ move[0], 'x', move[2], 'x']]

          @total_codes.each do |code|
	  	    code.each_with_index do |color, index|
  	    	  groups_r.each do |gcode|
  	    	  	correct_color = 0
  	    	    gcode.each_with_index do |gcolor, gindex|
                  if gcode[gindex] == code[gindex]
                  	correct_color += 1
                    #@correct_codes.push(code)
                  end
                end
                if correct_color >= 2
                  @correct_codes.push(code)
                end
              end
            end
          end

          if @correct_codes.uniq.length != @correct_codes.length
          	#puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
            @total_codes = @correct_codes.uniq!
          else
          	#puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
          	@total_codes = @correct_codes
          end

        when 3

          #puts "sa 3 r w feedbacku"
          #puts "kodow do iteracji jest #{@total_codes.count}"
          groups_r = [['x', move[1], move[2], move[3]], [ move[0], 'x', move[2], move[3]], [ move[0], move[1], move[2], 'x'], [move[0], move[1], 'x', move[3]]]

          @total_codes.each do |code|
	  	    code.each_with_index do |color, index|
  	    	  groups_r.each do |gcode|
  	    	  	correct_color = 0
  	    	    gcode.each_with_index do |gcolor, gindex|
                  if gcode[gindex] == code[gindex]
                    #@correct_codes.push(code)
                    correct_color += 1
                  end
                end
                if correct_color >= 3
                  @correct_codes.push(code)
                end
              end
            end
          end

          if @correct_codes.uniq.length != @correct_codes.length
          	#puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
            @total_codes = @correct_codes.uniq!
          else
          	#puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
          	@total_codes = @correct_codes
          end

        else
		  #puts "blad evaluation create_groups"
	  	end
	  end

	  if move.uniq.length != move.length
	  	@bad_code = []
	  	#puts "sa powtorzenia w kodzie"

	    h_feedback.each do |key, value|
		  if value.to_i > feedback.length
		  	@total_codes.each do |element|
		  	  keys_in_code = 0
		  	  element.each do |digit|
		  	    if digit == key
		  	      keys_in_code += 1
		  	    end
		  	  end
		  	  if keys_in_code >= value.to_i
		  	    @bad_code.push(element)
		  	  end
		  	end
		  else
		  	#puts "nie ma w histogramie (#{h_feedback} wartosci wiekszych (#{feedback.length})"
		  end
		end

		if @bad_code.uniq.length != @bad_code.length
		  @bad_code.uniq!
		  #puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
		  @total_codes = @total_codes - @bad_code
		else
		  #puts "kod nadal jest w bazie? = #{@total_codes.include?(["1", "2", "3", "4"])}"
		  @total_codes = @total_codes - @bad_code
		end
		#puts "kodow do iteracji jest #{@total_codes.count}"
	  end
	end

	def next_move

	  if $round == 0
        %w[1 1 2 2]
      else
        @total_codes.sample
      end
	end

  end
end

