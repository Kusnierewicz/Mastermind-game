module Mastermind
  class Board
  	attr_reader :grid

    def game_colors
      
    end

  	def initialize(input = {})
  	  @grid = input.fetch(:grid, default_grid)
  	end

    def print_board
      grid.each.with_index { |a, x| print x + 1, " - "; puts a.inspect }
    end 

    def decipher
      
    end

    def user_code
      input = ask("code:  ") { |q| q.echo = "*" }
      @code = input.split(", ")
    end

  	private

    

    def random_code
      

    end


  	def default_grid(rounds = 12)
  	  Array.new(rounds) { Array.new(2) { Array.new() } }
  	end 

  end
end