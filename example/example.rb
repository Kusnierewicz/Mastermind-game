require_relative "../lib/mastermind.rb"
puts "Welcome to mastermind"
me = Mastermind::Player.new({role: "hacker", name: "me"})
players = [me]

Mastermind::Game.new(players).play