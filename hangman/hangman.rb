require_relative 'lib/game'
require_relative 'lib/menu'


puts Time.new.strftime("%y-%m-%d %H:%M:%S")

Game.select_candidate_words()
game = Menu.display_menu
game.display
game.play_game