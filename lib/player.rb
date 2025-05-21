# frozen_string_literal: true

class Player
  def initialize(marker, ui, board)
    @marker = marker
    @ui = ui
    @board = board
  end

  def get_marker
    @marker
  end

  def place_on_board
    coords = @ui.ask_to_place(@board)
    @board.place_marker(@marker, coords[0], coords[1])
  end

end
