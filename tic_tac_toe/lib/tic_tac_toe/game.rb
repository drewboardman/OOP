module TicTacToe
  class Game
    attr_accessor :players, :board, :current_player, :other_player

    def initialize(players, board = Board.new)
      @players = players
      @board = board
      @current_player, @other_player = players.shuffle
    end

    def solicit_move
      "#{current_player.name}: Please enter a number between 1-9 that represents a position on the grid"
    end

    def get_move(move = gets.chomp)
      map_move(move)
    end

    def switch_players
      @current_player, @other_player = @other_player, @current_player
    end

    def game_over_message
      return "#{current_player.name} won!" if board.game_over == :winner
      return "Tie" if board.game_over == :draw
    end

  def play
    puts "#{current_player} goes first."
    while true
      board.default_grid
      puts ""
      puts solicit_move
      x,y = get_move
      board.set_cell(x,y, current_player.color)
      if board.game_over
        puts game_over_message
        board.default_grid
        return
      else
        switch_players
      end
    end
  end

private

    def map_move(move)
      mapping = {
        "1" => [0,0],
        "2" => [1,0],
        "3" => [2,0],
        "4" => [0,1],
        "5" => [1,1],
        "6" => [2,1],
        "7" => [0,2],
        "8" => [1,2],
        "9" => [2,2]
      }
      mapping[move]
    end

  end
end