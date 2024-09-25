require_relative 'player_creator'
require_relative 'deck'
require_relative 'board'
require_relative 'player'

class Game

    def initialize
        @player_creator = PlayerCreator.new
        @deck = Deck.new
        @board = Board.new(deck)
    end

    def add_players
        @players = @player_creator.get_players
        puts "Welcome #{@players.join(' and ')}"
    end

    def end_game
		!board.has_set? && deck.size == 0
    end

    def start
        puts "Game Start"
        while !end_game
            board.fill_board
            board.show_board

            # prompt for which player to choose cards
            puts "which player (1 or 2): "
            player_in = gets.chomp.to_i - 1
            curr_player = @players[player_in]

            # prompt for which cards to be chosen
            puts "which cards (separate with space): "
            cards_in = gets.chomp
            cards_index = cards_in.split.map(&:to_i)
            cards_index -= 1
            
            # selected three cards, check if set
            curr_cards = cards_index.map {|index| board.cards_on_board[index]}
            if board.valid_set?(curr_cards)
                curr_player.score_up
                for index in cards_index
                    board.cards_on_board.delete_at(index)
                end
            else
                puts "these three cards do not form a set"
            end
        end
        puts "Game End"
        puts "player1 score: #{@players[0].score}"
        puts "player2 score: #{@players[1].score}"
        if @players[0].score > @players[1].score
            puts "player1 win"
        elsif @players[0].score < @players[1].score
            puts "player2 win"
        else
            puts "draw"
        end
    end

end