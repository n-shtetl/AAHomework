## How to store dictionary in hash for fast lookup
## How to read from .txt file
## https://www.rubyguides.com/2018/08/ruby-set-class/
class Game
    attr_reader :fragment, :players, :dictionary

    def initialize(players)
        file_data = File.readlines("dictionary.txt").map(&:chomp)
        @dictionary = Set.new(file_data)
        @players = players
        @fragment = ""   
    end

    def play_round
        self.current_player(@players[0])
        until !self.take_turn(current_player)
            puts "-------------------"
        end
        puts "You win"
    end
    
    def current_player(player)
        @current_player = player
    end

    # def previous_player
        
    # end

    def next_player!
        if @current_player == @players[0]
            @current_player = @players[1]
        else
            @current_player = @players[0]
        end
    end

    def take_turn(player)
        puts "Enter a letter:"
        letter = gets.chomp
        if self.valid_play?(@fragment + letter)
            @fragment += letter
            self.next_player!
            return true
        else
            return false
        end
    end
            

    def valid_play?(potential)
        return false if @dictionary.include?(potential)
        @dictionary.any? {|word| word.start_with?(potential)}
    end
end