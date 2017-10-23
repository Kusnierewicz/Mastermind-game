require_relative '../lib/mastermind.rb'

puts '---------------------Welcome to Mastermind setup file-------------------------------'
puts 'Hello! How many players would be playing the game of Mastermind? Two is the maximum.'

def setup_players(how_many = gets.chomp)
  puts how_many.class
  until ('1'..'2').include?(how_many)
    puts 'Sorry but there can only be one or two players (input "1" or "2" please)'
    how_many = gets.chomp
  end
	if how_many == '2'
      puts 'player 1 name:'
      p1_name = gets.chomp
      puts "#{p1_name}, would you like to guess(h) or set a pass(m)?"
      p1_role = gets.chomp
      possible_roles = %w{m h hacker mastermind}
      until possible_roles.include?(p1_role)
        puts "Sorry but there isn't a role like this in mastermind (input 'm' or 'h' please)"
        p1_role = gets.chomp
      end
      p1_role = p1_role == 'm' || p1_role == 'mastermind' ? :m : :h
      p2_role = p1_role == :m ? :h : :m
      p1 = Mastermind::Player.new({role: p1_role, name: p1_name})
      puts 'player 2 name:'
      p2_name = gets.chomp
      p2 = Mastermind::Player.new({role: p2_role, name: p2_name})
      players = [p1, p2]
    elsif how_many == '1'
      puts 'player 1 name:'
      p1_name = gets.chomp
      puts "#{p1_name}, would you like to guess(h) or set a pass(m)?"
      p1_role = gets.chomp
      possible_roles = %w{m h hacker mastermind}
      until possible_roles.include?(p1_role)
        puts "Sorry but there isn't a role like this in mastermind (input 'm' or 'h' please)"
        p1_role = gets.chomp
      end
      p1_role = p1_role == 'm' || p1_role == 'mastermind' ? :m : :h
      p1 = Mastermind::Player.new({role: p1_role, name: p1_name})
      players = [p1]
    end
end

game = Mastermind::Game.new(setup_players).play