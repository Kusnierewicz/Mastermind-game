module Mastermind
  class Board
  	attr_reader :grid

    $colors = %w[1 2 3 4 5 6]

  	def initialize(input = {})
  	  @grid = input.fetch(:grid, default_grid)
  	end

    def print_board
      grid.each.with_index { |a, x| print x + 1, " - "; puts a.inspect }
    end 

    def read_board
      self.grid[$round][1]
    end

    def game_over
      return "Hacker was able to decipher the code and has won the game!!!" if winner?
      return "Hacker did not decipher the code and has lost the game..." if $round == 11
      false
    end

    def winner?
      return grid[$round][1].eql?(["r", "r", "r", "r"])
    end

    def descrambler
      @hints = []
      correct_code = []
      guess_to_iter = grid[$round][0]
      code_to_iter = @code
      
      code_to_iter.each.with_index do |color, index|
        if color == grid[$round][0][index]
          correct_code.push(color)
          @hints.push("r")
        end
      end

      code_to_iter -= correct_code
      guess_to_iter -= correct_code

      code_to_iter.each.with_index do |color, index|
        if guess_to_iter.include?(color)
            @hints.push("w")      
        end
      end  

      #@whites = @whites - @blacks

      #@whites.times do
      #  @hints.push("w")
      #end
      grid[$round][1] = @hints
    end

    def code_setup(mastermind, hacker)
      if mastermind.name == "computer"
        random_code(hacker)
      else
        user_code(mastermind)
      end
    end

    def user_code(mastermind)
      print "Hello #{mastermind.name}. As Mastermind, please enter the CODE!"
      input = ask(":  ") { |q| q.echo = "*" }
      @code = input.split("")
      print "CODE is set. Now it's turn for Hacker to show his skils!"
    end

    def random_code(hacker)
      @code = []
      4.times do 
        @code.push($colors.sample)
      end
      print "Hello #{hacker.name}! Computer has chosen the CODE! TRY TO SOLVE IT IF YOU CAN!"
    end

  	private

  	def default_grid(rounds = 12)
  	  Array.new(rounds) { Array.new(2) { Array.new() } }
  	end 

  end
end