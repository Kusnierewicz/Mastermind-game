module Mastermind
  class Game
  	attr_reader :players, :board, :round

  	def initialize(players, board = Board.new)
  	  @players = players
  	  @board = board
      $round = 0
  	end

    def players_setup(players)
      if players.length > 1
        @mastermind = players[0].role == "mastermind" ? players[0] : players[1]
        @hacker = players[1].role == "hacker" ? players[1] : players[0]
      elsif players.length == 1
        @mastermind = players[0].role == "mastermind" ? players[0] : Mastermind::Player.new({role: "mastermind", name: "computer"})
        @hacker = @mastermind.name == "computer" ? players[0] : Mastermind::Player.new({role: "mastermind", name: "computer"})
      end
      return @mastermind.name, @hacker.name
    end

  	def solicit_move
  	  print "Round #{$round + 1}! #{@hacker.name}, please enter a code proposal (correct input example: 1234 ):"
  	end

  	def get_move(proposal = gets.chomp)
  	  board.grid[$round][0] = proposal.split("")
  	end

    def next_move(mastermind)
      if mastermind.name != "computer"
        get_move
      else
        @hal = Mastermind::Ai.new
        ia_move
      end
    end

    def ia_move
      proposal = [] 
      n = @hal.doutput(board.grid[$round - 1][1])
      proposal = @hal.next_move(n)
      board.grid[$round][0] = proposal
    end

    def next_round()
      $round = $round + 1
    end

  	def play

      players_setup(@players)
      board.code_setup(@mastermind, @hacker)
      while true
        solicit_move
        next_move(@hacker)
        #board.print_board
        board.descrambler
        puts ""
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