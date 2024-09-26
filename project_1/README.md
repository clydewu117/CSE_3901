# CSE 3901 Project 1 - Game of Set

### Setup

No additional gems need to be install for playing the game.

To run the application, run "ruby main.rb".

Further instructions will be provided during the game.

### Features

Basic features of game of set are added into the game, including:

- Two players
- Draw appropriate number of cards to fill the board
- Verify the correctness of player-identified sets
- Refill the board after identified sets are removed
- End game when conditions are met
- Keep track of scores to identify the winner

### Function Directory

    card.rb:
        show_card: display four features of a card

    deck.rb:
        draw_cards: draw a given number of cards from deck
        size: return the size of the deck

    board.rb:
        fill_board: draw cards to fill the board, or draw cards when no sets on board
        show_board: display all cards on board
        has_set?: return if there is set on board
        valid_set?: return if the given combination of cards forms a set
        all_same_or_different?: return if the feature of the three cards are all the same or different
        get_cards: return an array of cards by indices
        remove_cards: remove cards from board by indices

    player.rb:
        to_s: return a string of the player's name
        score_up: add one to the player's score

    player_creator.rb:
        get_players: create two players

    game.rb:
        add_players: add two players into the game
        end_game?: check if the game should be ended
        start: start the game
