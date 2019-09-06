require_relative "card.rb"
require "byebug"
class Board
   
    #Array.new(4, [])
    attr_reader :size
    def initialize
        @size = 4
        @grid = Array.new(@size) {Array.new(@size){Card.new}}
        
    end

    def [](pos)
        #pos => [2,2]
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end

    def populate_board
        chars = ('a'..'h').to_a
        letter_pool = Hash.new(0)
        chars.each {|char| letter_pool[char] = 2}
        chars.each do |char|
            while letter_pool[char] > 0 do
                row = rand(0...@size)
                col = rand(0...@size)
                pos = [row, col]
                if self[pos].value == ""
                    self[pos].value = char
                    letter_pool[char] -= 1
                end    
            end
        end
    end

    def get_coordinate
        gets.chomp.split.map(&:to_i)
    end
    
    def print_board
        @grid.each do |row|
            new_row = []
            row.each do |card|
                if card.face_up
                    new_row << card.value
                else
                    new_row << "x"
                end
            end
            puts
            puts "#{new_row.join("  ")}"
        end
    end

    def game_over?
        new_arr = []
        @grid.each do |row|
            new_row = []
            row.each do |card|
                new_row << card.face_up
            end
            new_arr << new_row
        end
    # debugger
        if new_arr.flatten.all? 
            print "you win"
            return true
        end
        false
    end
    
    def turn
        puts "Enter 1st coordinate like '2 3' "
        coordinate1 = self.get_coordinate
        self[coordinate1].flip_card
        self.print_board
        puts "Enter 2nd coordinate"
        coordinate2 = self.get_coordinate
        self[coordinate2].flip_card
        self.print_board
        if self[coordinate1] != self[coordinate2]
            self[coordinate1].flip_card
            self[coordinate2].flip_card
            puts "Wrong match"
        end        
    end
    
end
