class Menu
  def self.display_menu
    puts 'Select your save or start a new game!'
    directory = Dir.entries './saves'
    p directory
    case directory
    in [_, _, *saves]
    end
    puts '0: Create a new game'
    saves.each_with_index do |element, index|
      puts "#{index + 1}: Load save #{element}"
    end
    user_choice = gets.chomp

    return Game.start_new_game if user_choice == '0'

    Game.load_save(saves[user_choice.to_i - 1])
  end

end