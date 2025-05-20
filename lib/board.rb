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
    scan_row_for_win || scan_col_for_win || scan_diag_for_win
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
      unless symbol_changed
        return true
      end
    }
    false
  end

  private def scan_col_for_win
    (0...@board_size).each { |i|
      symbol_changed = false
      scan_symbol = @board_rep[0][i]
      if scan_symbol == ""
        return false
      end
      (0...@board_size).each { |j|
        if @board_rep[j][i] != scan_symbol
          symbol_changed = true
        end
      }
      unless symbol_changed
        return true
      end
    }
    false
  end

  private def scan_diag_for_win
    #descending
    symbol_changed = false
    scan_symbol = @board_rep[0][0]
    (0...@board_size).each { |i|
      if scan_symbol == ""
        symbol_changed = true
        break
      end

      if @board_rep[i][i] != scan_symbol
        symbol_changed = true
      end


    }
    unless symbol_changed
      return true
    end

    #ascending
    symbol_changed = false
    scan_symbol = @board_rep[@board_size-1][0]
    (0...@board_size).each { |i|
      if scan_symbol == ""
        return false
      end

      if @board_rep[i][@board_size-1-i] != scan_symbol
        symbol_changed = true
      end

    }
    unless symbol_changed
      return true
    end
     false
  end

end
