# frozen_string_literal: true

class Board
  def initialize(ui, board_size)
    @ui = ui
    @board_size = board_size
    @board_rep = Array.new(board_size) {Array.new(board_size) {""}}
  end

  def get_size
    @board_size
  end

  def get_rep
    @board_rep
  end

  def place_marker(symbol, row, col)
    if @board_rep[row][col] != ""
      raise RuntimeError.new("Cannot place " + symbol + " in non-empty space")
    else
    @board_rep[row][col] = symbol
    end
  end

end
