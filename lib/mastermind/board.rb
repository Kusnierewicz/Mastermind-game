module Mastermind
  class Board
  	attr_reader :grid

    @@colors = %w[b g r p y o]
    @@pointers = %w[b w]

  	def initialize(input = {})
  	  @grid = input.fetch(:grid, default_grid)
  	end

    def print_board
      grid.each.with_index { |a, x| print x + 1, " - "; puts a.inspect }
    end 

    def game_over
      return "Player was able to decipher the code and has won the game!!!" if winner?
      return "Player did not decipher the code and has lost the game..." if $round == 11
      false
    end

    def winner?
      return grid[$round][1].eql?(["b", "b", "b", "b"])
    end

    def descrambler
      @hints = []
      @blacks = 0
      @whites = 0
      code_to_iter = @code
      
      code_to_iter.each.with_index do |color, index|
        if color == grid[$round][0][index]
            @blacks += 1
            @hints.push("b")
        elsif code_to_iter.include?(grid[$round][0][index])
            @whites += 1           
        end
      end

      #code_to_iter.each.with_index do |color, index|
      #  if code_to_iter.include?(grid[$round][0][index])
      #      @whites += 1      
      #  end
      #end  

      @whites = @whites - @blacks

      @whites.times do
        @hints.push("w")
      end
      grid[$round][1] = @hints

    end

    def histogram_move
      @histogram_move = Hash.new(0)
      grid[$round][0].each { |color| @histogram_move[color] += 1 }
      @histogram_move
    end

    def user_code
      input = ask("code:  ") { |q| q.echo = "*" }
      @code = input.split("")
      @histogram_code = Hash.new(0)
      @code.each { |color| @histogram_code[color] += 1 }
      @histogram_code
    end

    def random_code
      @code = []
      4.times do 
        @code.push(@@colors.sample)
      end
      @histogram_code = Hash.new(0)
      @code.each { |color| @histogram_code[color] += 1 }
      return @histogram_code
    end

  	private

  	def default_grid(rounds = 12)
  	  Array.new(rounds) { Array.new(2) { Array.new() } }
  	end 

  end
end