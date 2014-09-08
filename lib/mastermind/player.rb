module Mastermind
	class Player
	  attr_reader :role, :name
	  def initialize(input)
	  	@color = input.fetch(:role)
	  	@name = input.fetch(:name)
	  end
	end
end