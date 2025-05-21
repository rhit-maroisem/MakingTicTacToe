# frozen_string_literal: true

require_relative 'test_helper'
require 'ui'
require 'board'
require'player'

class PlayerTestsTest < Minitest::Test

  def setup
  end

  def teardown
    # Do nothing
  end

  def test_player_init
    mock_ui = Minitest::Mock.new
    board = Minitest::Mock.new
    player1 = Player.new("X", mock_ui, board)
    assert_equal "X", player1.get_marker
  end

  def test_two_players_init
    mock_ui = Minitest::Mock.new
    board = Minitest::Mock.new
    player1 = Player.new("X",mock_ui, board)
    assert_equal "X", player1.get_marker
    player2 = Player.new("O",mock_ui, board)
    assert_equal "O", player2.get_marker
  end

  def test_place_on_board
    mock_ui = Minitest::Mock.new
    mock_board = Minitest::Mock.new
    player1 = Player.new("X",mock_ui, mock_board)

    mock_ui.expect(:ask_to_place, [0,0], [mock_board])
    mock_board.expect(:place_marker,true,["X",0,0])

    player1.place_on_board

    mock_ui.verify
    mock_board.verify

  end


end
