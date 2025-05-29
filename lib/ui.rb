# frozen_string_literal: true

class Ui
  def initialize

  end

  #I wrote the logic, but chatGPT helped me format it nicely
  def ask_to_place(board)
    index_col = -1
    index_row = -1
    print_board(board)
    puts ""
    puts "Please choose a valid square number "
    puts "from 1 to %d to place your marker in" % [board.get_size * board.get_size]
    while true
      input = gets.chomp.to_i
      if input < (board.get_size * board.get_size) + 1 && input > 0
        index_col = (input - 1) % board.get_size
        index_row = (input - 1) / board.get_size
        if board.get_square(index_row, index_col) == ""
          return [index_row, index_col]
        end
      end
      puts "invalid selection"
    end
  end


  def game_over(symbol)
    puts "The " + symbol.to_s + "player has won the game!"
  end

  def game_draw
    puts "The game ended in a tie"
  end

  def start_game(symbol1, symbol2)
    puts "Tic Tac Toe has Started! Player 1 is " + symbol1.to_s + " and Player 2 is " + symbol2.to_s
  end

  def print_board(mock_board)
    size = mock_board.get_size
    total_cells = size * size
    max_content_width = total_cells.to_s.length  # width needed for largest number (e.g., "16" → 2)

    # Function to pad and center content
    def format_cell(content, width)
      content = content.to_s
      content.center(width)
    end

    horizontal = "─" * (max_content_width + 2)
    # Top border
    print "┌"
    print ((horizontal + "┬") * (size - 1)) + horizontal + "┐"
    puts

    index = 1
    (0...size).each do |i|
      print "│"
      (0...size).each do |j|
        cell = mock_board.get_square(i, j)
        cell = index.to_s if cell == ""  # fallback to numbering empty cells
        print " #{format_cell(cell, max_content_width)} │"
        index += 1
      end
      puts

      if i < size - 1
        print "├"
        print ((horizontal + "┼") * (size - 1)) + horizontal + "┤"
        puts
      else
        print "└"
        print ((horizontal + "┴") * (size - 1)) + horizontal + "┘"
        puts
      end
    end
  end

end
