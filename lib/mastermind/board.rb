module Mastermind
  class Board
  	attr_reader :grid

    @@colors = %w[b g r p y o]
    @@pointers = %w[r w]

    def game_colors
      
    end

  	def initialize(input = {})
  	  @grid = input.fetch(:grid, default_grid)
  	end

    def print_board
      grid.each.with_index { |a, x| print x + 1, " - "; puts a.inspect }
    end 

    

    def user_code
      input = ask("code:  ") { |q| q.echo = "*" }
      @code = input.split(", ")
    end

    def print_code
      random_code
      #puts @code
    end

  	private



    

    def random_code
      @code = []
      4.times do 
        @code.push(@@colors.sample)
      end
      @code
    end


  	def default_grid(rounds = 12)
  	  Array.new(rounds) { Array.new(2) { Array.new() } }
  	end 

  end
end