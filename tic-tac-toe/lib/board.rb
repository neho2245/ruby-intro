class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '#') }
  end

  def display
    @grid.each do |row|
      row.each do |col|
        print "#{col} "
      end
      puts
    end
  end

  def place(symbol, position)
    begin
      @grid[position[0]][position[1]] = symbol
    rescue StandardError
      p 'Error, index out of bounds!'
    end
  end

  def check_win(player_turn)
    # check for rows first
    rows = @grid.any? do |row|
      row.all? { |element| element == player_turn }
    end
    # check for columns
    cols = false
    for i in (0..2)
      result = []
      for j in (0..2)
        result << @grid[j][i]
      end
      cols ||= result.all? { |element| element == player_turn }
    end

    # check for diagonals
    main_diagonal = (0..2).reduce([]) do |acc, i|
      acc << @grid[i][i]
    end.all? { |element| element == player_turn }

    secondary_diagonal = (0..2).reduce([]) do |acc, i|
      acc << @grid[2 - i][i]
    end.all? { |element| element == player_turn }

    rows || cols || main_diagonal || secondary_diagonal
  end
end
