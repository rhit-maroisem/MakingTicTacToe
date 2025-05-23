# frozen_string_literal: true

class Game
  @board
  @player1
  @player2
  def initialize(board, player1, player2)
    @board = board
    @player1 = player1
    @player2 = player2
  end

  def game_loop
    while true do
      take_turn(@player1)
      if check_for_win
        break
      end
      take_turn(@player2)
      if check_for_win
        break
      end
    end
  end

  private def take_turn(player)
    player.place_on_board
  end

  private def check_for_win
    @board.is_game_over?
  end

end
