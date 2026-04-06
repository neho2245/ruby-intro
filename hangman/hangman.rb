require_relative 'lib/game'

Game.select_candidate_words()
game = Game.new
game.display
game.play_game