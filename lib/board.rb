# frozen_string_literal: true

class Board
  def initialize( board_size)
    @board_size = board_size
    @board_rep = Array.new(board_size) {Array.new(board_size) {""}}
  end

  def get_size
    @board_size
  end

  def get_square(row,col)
    @board_rep[row][col]
  end

  def place_marker(symbol, row, col)
    if @board_rep[row][col] != ""
      raise RuntimeError.new("Cannot place " + symbol + " in non-empty space")
    else
    @board_rep[row][col] = symbol
    end
  end


  def is_game_over?
    scan_lines_for_win(row_coords) ||
      scan_lines_for_win(col_coords) ||
      scan_lines_for_win(diag_coords)
  end

  private
  # @note
  # The lines below were refactored by chatGPT to reduce duplicate code.
  # As I am new to ruby, I wasn't aware an approach like this could be taken,
  # but this seems quite elegant
  def scan_lines_for_win(lines)
    lines.any? do |coords|
      symbols = coords.map { |i, j| @board_rep[i][j] } # makes an array of all the symbols in that line
       symbols.uniq.size == 1 && symbols.first != ""  # returns true if the whole line is all the same, and non-empty
    end
  end

  # Build coordinate sets for each scan
  def row_coords
    (0...@board_size).map do |i|
      (0...@board_size).map { |j| [i, j] }
    end
  end

  def col_coords
    (0...@board_size).map do |j|
      (0...@board_size).map { |i| [i, j] }
    end
  end

  def diag_coords
    [
      (0...@board_size).map { |i| [i, i] },                                # Top-left to bottom-right
      (0...@board_size).map { |i| [@board_size - 1 - i, i] }              # Bottom-left to top-right
    ]
  end


end
