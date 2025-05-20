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

  def is_game_over?
    return scan_row_for_win
  end

  private def scan_row_for_win
    (0...@board_size).each { |i|
      symbol_changed = false
      scan_symbol = @board_rep[i][0]
      if scan_symbol == ""
        return false
      end
      (0...@board_size).each { |j|
        if @board_rep[i][j] != scan_symbol
          symbol_changed = true
        end
      }
      if symbol_changed == false
        return true
      end
    }
    return false
  end

end
