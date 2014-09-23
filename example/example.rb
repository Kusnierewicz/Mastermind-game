require_relative "../lib/mastermind.rb"


puts "--------------------------------Welcome to mastermind---------------------------------------"
Luc = Mastermind::Player.new({role: "hacker", name: "Luc"})
Piotr = Mastermind::Player.new({role: "mastermind", name: "Piotr"})
players = [Piotr]

Mastermind::Game.new(players).play