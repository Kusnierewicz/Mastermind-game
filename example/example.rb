require_relative "../lib/mastermind.rb"
puts "Welcome to mastermind"
me = Mastermind::Player.new({role: "hacker", name: "me"})
not_me = Mastermind::Player.new({role: "mastermind", name: "not_me"})
players = [not_me]

Mastermind::Game.new(players).play