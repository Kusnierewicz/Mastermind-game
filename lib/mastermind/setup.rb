module Mastermind
  class Setup
  	attr_reader

  	def initialize
  	  puts "Welcome to mastermind"
  	  puts "How many players will play?"
  	  noplayers = gets.chomp
  	  players(noplayers)
  	  Mastermind::Game.new(players).play
  	end

  	def players(noplayers)
  	  @players = []
	  if noplayers == 2
	  	puts "Name of the first player:"
	  	player1_name = gets.chomp
	  	puts "Role of the first player:"
	  	player1_role = gets.chomp
	  	player1 = Mastermind::Player.new({role: "#{player1_role}", name: "#{player1_name}"})
	  	puts "Name of the second player:"
	  	player2_name = gets.chomp
	  	puts "Role of the second player:"
	  	player2_role = gets.chomp
	  	player2 = Mastermind::Player.new({role: "#{player2_role}", name: "#{player2_name}"})
	  	@players = [player1, player2]
	  elsif noplayers == 1
	  	puts "Name of the first player:"
	  	player1_name = gets.chomp
	  	puts "Role of the first player:"
	  	player1_role = gets.chomp
	  	player1 = Mastermind::Player.new({role: "#{player1_role}", name: "#{player1_name}"})
	  	@players = [player1]
	  end
	end

  end
end
