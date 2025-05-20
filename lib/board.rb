# frozen_string_literal: true

class Board
  def initialize(ui, board_size)
    @ui = ui
    @board_size = board_size
  end

  def get_size
    @board_size
  end
end
