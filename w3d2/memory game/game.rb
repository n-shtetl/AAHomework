require_relative "board"

game = Board.new
game.populate_board


until game.game_over? do
    game.print_board
    game.turn
end


