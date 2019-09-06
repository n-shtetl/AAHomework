require_relative "game"

game = Game.new([])

until battleship.game_over? do
  puts "-------------------------"
  battleship.turn
end
