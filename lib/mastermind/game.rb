module Mastermind
  class Game
  	attr_reader :players, :board, :current_player, :other_player, :round

  	def initialize(players, board = Board.new)
  	  @players = players
  	  @board = board
      $round = 0
  	end

  	def solicit_move
  	  print "Round #{$round + 1}, #{players[0].name}: Enter a code proposal (correct input format: a, b, c, d)"
  	end

  	def get_move(proposal = gets.chomp)
  	  board.grid[$round][0] = proposal.split("")
  	end

    def next_round()
      $round = $round + 1
    end

  	def play
      board.random_code
      while true
        solicit_move
        get_move
        board.histogram_move
        board.descrambler
        board.print_board
        if board.game_over
          puts board.game_over
          return
        end
        next_round      
      end
  	end

  end
end