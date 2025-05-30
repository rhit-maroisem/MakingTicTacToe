# frozen_string_literal: true

require_relative 'test_helper'
require 'ui'
require 'board'

class BoardTest < Minitest::Test

  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_board_init
    board = Board.new(3)
    assert_equal(3, board.get_size)
    board2 = Board.new(4)
    assert_equal(4, board2.get_size)
  end

  def test_board_rep_init
    board = Board.new(3)
    assert_equal(3, board.get_size)
    for i in 0...3 do
      for j in 0...3 do
        assert_equal("", board.get_square(i,j))
      end
    end

  end

  def test_get_square_init
    board = Board.new( 3)
    assert_equal("",board.get_square(0,0))
  end


  def test_place_marker_valid
    board = Board.new( 3)
    assert_equal("", board.get_square(0,0))
    board.place_marker("X",0,0)
    assert_equal("X", board.get_square(0,0))
  end

  def test_place_marker_invalid
    board = Board.new(3)
    assert_equal("", board.get_square(0,0))
    board.place_marker("X",0,0)
    err = assert_raises RuntimeError do
      board.place_marker("O",0,0)
    end
    assert_equal("Cannot place O in non-empty space", err.to_s)
    err = assert_raises RuntimeError do
      board.place_marker("X",0,0)
    end
    assert_equal("Cannot place X in non-empty space", err.to_s)
  end


  def test_player_won_horizontal
    board = Board.new(3)
    board.place_marker("X",0,0)
    board.place_marker("X",0,1)
    board.place_marker("X",1,2)
    assert_equal(false, board.is_game_over?)
    board.place_marker("X",0,2)
    assert_equal(true, board.is_game_over?)
  end

  def test_player_no_win_horizontal
    board = Board.new(3)
    board.place_marker("X",0,0)
    board.place_marker("O",0,1)
    assert_equal(false, board.is_game_over?)
    board.place_marker("X",0,2)
    assert_equal(false, board.is_game_over?)
  end

  def test_player_won_vertical
    board = Board.new(3)
    board.place_marker("X",0,0)
    board.place_marker("X",1,0)
    board.place_marker("X",1,1)
    assert_equal(false, board.is_game_over?)
    board.place_marker("X",2,0)
    assert_equal(true, board.is_game_over?)
  end

  def test_player_no_win_vertical
    board = Board.new(3)
    board.place_marker("X",0,0)
    board.place_marker("0",1,0)
    assert_equal(false, board.is_game_over?)
    board.place_marker("X",2,0)
    assert_equal(false, board.is_game_over?)
  end

  def test_player_won_diagonal_desc
    board = Board.new(3)
    board.place_marker("X",0,0)
    board.place_marker("X",1,1)
    board.place_marker("X",2,1)
    assert_equal(false, board.is_game_over?)
    board.place_marker("X",2,2)
    assert_equal(true, board.is_game_over?)
  end

  def test_player_won_diagonal_asc
    board = Board.new(3)
    board.place_marker("X",0,2)
    board.place_marker("X",1,1)
    board.place_marker("X",1,0)
    assert_equal(false, board.is_game_over?)
    board.place_marker("X",2,0)
    assert_equal(true, board.is_game_over?)
  end

  def test_is_board_full_true
    board = Board.new(3)
    (0...3).each { |i|
      (0...3).each { |j|
        board.place_marker("X", i, j)
      }
    }

    assert_equal(true,board.is_board_full?)
  end

  def test_is_board_full_false
    board = Board.new(3)

    board.place_marker("X",0,0)

    assert_equal(false,board.is_board_full?)
  end



end
