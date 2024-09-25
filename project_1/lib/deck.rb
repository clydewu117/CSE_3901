require_relative 'card'

class Deck

    def initialize

        @deck = []

        # create four features
        numbers = ["one", "two", "three"]
        shapes = ["diamond", "squiggle", "oval"]
        shadings = ["striped", "solid", "open"]
        colors = ["red", "green", "purple"]

        # fill deck
        for number in numbers
            for shape in shapes
                for shading in shadings
                    for color in colors
                        card = Card.new(number, shape, shading, color)
                        @deck.push(card)
                    end
                end
            end
        end

        # shuffle deck
        @deck = @deck.shuffle
    
    end

    # draw a given number of cards from the deck
    def draw_cards(count)
        drawn_cards = @deck.shift(count)
        return drawn_cards
    end

    # return current size of the deck
    def size
        @deck.size  
    end

end
