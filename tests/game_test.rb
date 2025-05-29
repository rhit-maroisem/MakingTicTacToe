# frozen_string_literal: true

require 'minitest/autorun'
require 'game'

class GameTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_take_turn
    mock_board = Minitest::Mock.new
    mock_p1 = Minitest::Mock.new
    mock_p2 = Minitest::Mock.new
    mock_ui = Minitest::Mock.new

    game = Game.new(mock_board,mock_p1,mock_p2,mock_ui)

    mock_p1.expect(:place_on_board,true)
    game.send(:take_turn, mock_p1)
    mock_p1.verify

  end

  def test_game_over
    mock_board = Minitest::Mock.new
    mock_p1 = Minitest::Mock.new
    mock_p2 = Minitest::Mock.new
    mock_ui = Minitest::Mock.new

    game = Game.new(mock_board,mock_p1,mock_p2,mock_ui)

    mock_board.expect(:is_game_over?, true)
    game.send(:check_for_win)

    mock_board.verify
  end

  def test_run_game_simple
    mock_board = Minitest::Mock.new
    mock_p1 = Minitest::Mock.new
    mock_p2 = Minitest::Mock.new
    mock_ui = Minitest::Mock.new

    game = Game.new(mock_board,mock_p1,mock_p2,mock_ui)

    mock_p1.expect(:get_marker, "X")
    mock_p2.expect(:get_marker, "O")
    mock_ui.expect(:start_game, true, %w[X O])

    mock_p1.expect(:place_on_board,true)
    mock_board.expect(:is_game_over?, false)

    mock_p2.expect(:place_on_board,true)
    mock_board.expect(:is_game_over?, false)

    mock_p1.expect(:place_on_board,true)
    mock_board.expect(:is_game_over?, false)

    mock_p2.expect(:place_on_board,true)
    mock_board.expect(:is_game_over?, false)

    mock_p1.expect(:place_on_board,true)
    mock_board.expect(:is_game_over?, true)

    mock_p1.expect(:get_marker,"X")
    mock_ui.expect(:game_over,true,["X"])

    game.game_loop

    mock_p1.verify
    mock_p2.verify
    mock_board.verify
    mock_ui.verify
  end
end
