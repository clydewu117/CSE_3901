require_relative 'deck'
require_relative 'card'

class Board

    def initialize(deck)
        @cards_on_board = []
        @board_size = 12
        @deck = deck
    end

    def fill_board
        # draw cards until there are 12 cards on board
        if @cards_on_board.size < board_size
            diff = board_size - @cards_on_board.size
            puts "Currently #{@cards_on_board.size} cards on board, will draw #{diff} cards"
            @cards_on_board.push(*@deck.draw_cards(diff))
        end
        # if no set on board, repeatedly draw 3 cards until there is a set
        while !has_set?
            puts "Currently no set on board, will draw 3 cards"
            if @deck.size < 3
                puts "no enough cards in deck, fail to draw(1)"
                break
            end
            @cards_on_board.push(*@deck.draw_cards(3))
        end
    end

    def show_board
        puts "cards on board:"
        count = 1
        for card in @cards_on_board
            puts "card #{count}:"
            card.show_card
            count += 1
        end
    end

    def has_set?
        for combination in @cards_on_board.combination(3)
            if valid_set?(combination)
                return true
            end
        end
        return false
    end

    def valid_set?(cards)
        all_same_or_different?([cards[0].number, cards[1].number, card[2].number]) &&
        all_same_or_different?([cards[0].shape, cards[1].shape, card[2].shape]) &&
        all_same_or_different?([cards[0].shading, cards[1].shading, card[2].shading]) &&
        all_same_or_different?([cards[0].color, cards[1].color, card[2].color])
    end

    def all_same_or_different?(features)
        features.uniq.size == 1 || features.uniq.size == 3
    end

end