require_relative 'lib/game'


puts Time.new.strftime("%y-%m-%d %H:%M:%S")

Game.select_candidate_words()
game = Game.new
game.display
game.play_game