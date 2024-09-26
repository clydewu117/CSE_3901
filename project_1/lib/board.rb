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
        if @cards_on_board.size < @board_size
            diff = @board_size - @cards_on_board.size
            puts "Currently #{@cards_on_board.size} cards on board, will draw #{diff} cards"
            if @deck.size < diff
                puts "No enough cards in deck, fail to draw(1)"
            else
                @cards_on_board.push(*@deck.draw_cards(diff))
            end
        end
        # if no set on board, repeatedly draw 3 cards until there is a set
        while !has_set?
            puts "Currently no set on board, now #{@cards_on_board.size} cards, will draw 3 cards"
            if @deck.size < 3
                puts "No enough cards in deck, fail to draw(2)"
                break
            end
            @cards_on_board.push(*@deck.draw_cards(3))
        end
    end

    # show each card on board by index
    def show_board
        puts "Cards on board:"
        count = 1
        for card in @cards_on_board
            puts "card #{count}:"
            card.show_card
            count += 1
        end
    end

    # check if there is at least a set on board
    def has_set?
        for combination in @cards_on_board.combination(3)
            if valid_set?(combination)
                return true
            end
        end
        return false
    end

    # check if a given combination of three cards is a set
    def valid_set?(cards)
        all_same_or_different?([cards[0].number, cards[1].number, cards[2].number]) &&
        all_same_or_different?([cards[0].shape, cards[1].shape, cards[2].shape]) &&
        all_same_or_different?([cards[0].shading, cards[1].shading, cards[2].shading]) &&
        all_same_or_different?([cards[0].color, cards[1].color, cards[2].color])
    end

    # check if a feature from three cards is the same of all different
    def all_same_or_different?(features)
        features.uniq.size == 1 || features.uniq.size == 3
    end

    # return an array of three cards by given indices
    def get_cards(indices)
        cards = []
        for index in indices
            cards.push(@cards_on_board[index])
        end
        cards
    end

    # remove cards from board by given indices
    def remove_cards(indices)
        indices = indices.reverse
        for index in indices
            @cards_on_board.delete_at(index)
        end
    end

end