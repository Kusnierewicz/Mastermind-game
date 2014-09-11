module Mastermind
  class Board
  	attr_reader :grid

    @@colors = %w[b g r p y o]
    @@pointers = %w[b w]

    def game_colors
      
    end

  	def initialize(input = {})
  	  @grid = input.fetch(:grid, default_grid)
  	end

    def print_board
      grid.each.with_index { |a, x| print x + 1, " - "; puts a.inspect }
    end 

    def decipher
      @hints = []
      @blacks = 0
      @whites = 0
      
      @code.each do |color|
        grid[game.round][0].each do |move_color|
          if color == move_color
            @blacks += 1
            @hints.push("b")
          end        
        end
      end


    end

    def histagram_move
      @histogram_move = {}
      grid[game.round][0].each { |color| @histogram_move[color] += 1 }
      @histogram_move
    end

    def user_code
      input = ask("code:  ") { |q| q.echo = "*" }
      @code = input.split(", ")
      @histogram_code = {}
      @code.each { |color| @histogram_code[color] += 1 }
      @histogram_code
    end

    def random_code
      @code = []
      4.times do 
        @code.push(@@colors.sample)
      end
      @histogram_code = {}
      @code.each { |color| @histogram_code[color] += 1 }
      @histogram_code
    end

    def print_code
      random_code
      #puts @code
    end

  	private



    

    


  	def default_grid(rounds = 12)
  	  Array.new(rounds) { Array.new(2) { Array.new() } }
  	end 

  end
end