# frozen_string_literal: true

require 'minitest/autorun'
require './lib/ui'
require './lib/board'

class BoardTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_board_init
    ui = Ui.new
    board = Board.new(ui, 3)
    assert_equal(3, board.get_size)
    board2 = Board.new(ui, 4)
    assert_equal(4, board2.get_size)
  end

  def test_board_rep_init
    ui = Ui.new
    board = Board.new(ui, 3)
    assert_equal(3, board.get_size)
    rep_array = board.get_rep
    assert_equal(3, rep_array.length)
    assert_equal(3, rep_array[0].length)
    rep_array.each {|arr| arr.all? {|entry| assert_equal("",entry)} }

  end
end
