# frozen_string_literal: true

class Game
  @board
  @player1
  @player2
  @ui
  def initialize(board, player1, player2, ui)
    @board = board
    @player1 = player1
    @player2 = player2
    @ui = ui
  end

  def game_loop
    @ui.start_game(@player1.get_marker, @player2.get_marker)
    while true do
      take_turn(@player1)
      if check_for_win
        @ui.game_over(@player1.get_marker)
        break
      end
      take_turn(@player2)
      if check_for_win
        @ui.game_over(@player1.get_marker)
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
