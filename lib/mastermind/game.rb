module Mastermind
  class Game
  	attr_reader :players, :board, :current_player, :other_player, :round

  	def initialize(players, board = Board.new)
  	  @players = players
  	  @board = board
      @round = 0
  	end

  	def solicit_move
  	  print "Round #{round}, #{players[0].name}: Enter a code proposal (correct input format: a, b, c, d)"
  	end

  	def game_over_message
  	  "#{current_player.name}: won the game!"
  	end

  	def get_move(proposal = gets.chomp)
  	  board.grid[round][0] = proposal.split(", ")
  	end

    def next_round()
      @round = @round + 1
    end

  	def play
  	  puts "#{players[0].name} has randomly been selected as the first player"

      #board.user_code


      board.print_board
      solicit_move
      get_move
      next_round

      board.print_board
      solicit_move
      get_move
      next_round

      board.print_board
      solicit_move
      get_move
      next_round




  	end

  end
end