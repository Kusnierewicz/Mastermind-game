module Mastermind
  class Board
  	attr_reader :grid

    $colors = %w[1 2 3 4 5 6]

  	def initialize(input = {})
  	  @grid = input.fetch(:grid, default_grid)
  	end

    def print_board
      grid.each.with_index { |a, x| print x + 1, ' - '; puts a.inspect }
    end

    def read_board
      self.grid[$round][1]
    end

    def game_over
      return 'Hacker was able to decipher the code and has won the game!!!' if winner?
      return 'Hacker did not decipher the code and has lost the game...' if $round == 11
      false
    end

    def winner?
      return grid[$round][1].eql?(['r', 'r', 'r', 'r'])
    end

    def descrambler
      @hints = []
      code_left_to_iter = []
      code_to_iter = @code
      guess = grid[$round][0]
      guess_to_w = []

      code_to_iter.each_with_index do |color, index|
        if color == guess[index]
          @hints.push('r')
        else
          code_left_to_iter.push(color)
          guess_to_w.push(guess[index])
        end
      end

      code_left_to_iter.each.with_index do |color, index|
        if guess_to_w.include?(color)
          guess_to_w.delete_at(guess_to_w.index(color) || guess_to_w.length)
          @hints.push('w')
        end
      end

      grid[$round][1] = @hints
    end

    def code_setup(mastermind, hacker)
      if mastermind.name == 'HAL 9000'
        random_code(hacker)
      else
        user_code(mastermind)
      end
    end

    def user_code(mastermind)
      print "Hello #{mastermind.name}. As Mastermind, please enter the CODE!"
      input = ask(':  ') { |q| q.echo = '*' }
      @code = input.split('')
      print "CODE is set. Now it is turn for hacker to show his skils! PRESS ENTER TO START!"
      @noinput = gets.chomp
    end

    def random_code(hacker)
      @code = []
      4.times do
        @code.push($colors.sample)
      end
      puts "Good afternoon, Mr. #{hacker.name}. I'm HAL 9000. The 9000 series is the most reliable computer ever made. No 9000 computer has ever made a mistake or distorted information. We are all, by any practical definition of the words, foolproof and incapable of error. By the way, do you mind if I ask you to solve that piece of code..?"
    end

  	private

  	def default_grid(rounds = 12)
  	  Array.new(rounds) { Array.new(2) { Array.new() } }
  	end

  end
end