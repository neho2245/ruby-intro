require_relative 'board'

class Game
  @@symbols = %w[X O]

  attr_accessor :player_turn

  def initialize
    @player_turn = @@symbols.sample
    @board = Board.new
    puts "Player #{player_turn} starts the game"
    @board.display
  end

  def play_round
    res = false
    until res
      selection = get_input
      @board.place(player_turn, selection)
      @board.display
      res = @board.check_win(player_turn)
      @player_turn = if player_turn == 'X'
                      'O'
                     else
                      'X'
                     end
    end
  end

  def get_input
    begin
      puts "It is player #{@player_turn} turn"
      print 'Row:'
      row = gets.chomp
      print 'Col:'
      col = gets.chomp
      [Integer(row), Integer(col)]
    rescue StandardError
      puts 'Input a valid choice!'
      retry
    end
  end
end
