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
        @deck.shuffle!
    
    end

    def draw_cards(count)
        if @deck.size < count
            puts "no enough cards in deck, fail to draw(2)"
            return nil
        end
        drawn_cards = @deck.shift(count)
        return drawn_cards
    end

end
