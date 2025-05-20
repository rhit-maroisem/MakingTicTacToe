# frozen_string_literal: true

require 'test_helper'
require './lib/player'


class PlayerTestsTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_player_init
    player1 = Player.new("X")
    assert_equal "X", player1.get_marker
  end

  def test_two_players_init
    player1 = Player.new("X")
    assert_equal "X", player1.get_marker
    player2 = Player.new("O")
    assert_equal "O", player2.get_marker
  end

  def test_place_on_board
    #mock board
    player1 = Player.new("X")
  end


end
