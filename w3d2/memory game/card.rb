class Card
    
    attr_accessor :face_up, :value
    
    def initialize
        @value = ""
        @face_up = false
    end
    def flip_card
        #card.display when valid coordinate
        if @face_up
            @face_up = false
        else
            @face_up = true
        end
    end

    def 

    def display
        if @face_up
            @value
        end
    end

    def ==(other_card)
        self.value == other_card.value
    end

end
#choose coordinate 1, call flip_card, display
#choose coordinate 2, call flip_card, display
# if match
#     do nothing
# else turn card1, turn card2

#print hidden_ships
#coordinate, print reveal board + new coordinate
#changed board @coordinate to card.value
#changed board @coordinate to card.value