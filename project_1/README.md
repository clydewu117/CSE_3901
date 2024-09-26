# CSE 3901 project1 - Game of Set

### Setup

There is no additional gems needed to be install for playing the game.

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

### Method Dirctory

    card.rb:
        show_card

    deck.rb:
        draw_cards
        size

    board.rb:
        fill_board
        show_board
        has_set?
        valid_set?
        all_same_or_different?
        get_cards
        remove_cards

    player.rb:
        to_s
        score_up

    player_creator.rb:
        get_players

    game.rb:
        add_players
        end_game?
        start
