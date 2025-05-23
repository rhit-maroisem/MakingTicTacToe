# frozen_string_literal: true

require_relative 'ui'
require_relative 'board'
require_relative 'player'
require_relative 'game'

board = Board.new(3)
ui = Ui.new
player_1 = Player.new("X", ui, board)
player_2 = Player.new("O", ui, board)

game = Game.new(board, player_1, player_2)
game.game_loop