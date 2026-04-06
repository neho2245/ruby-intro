class Game
  @@candidate_words = []

  # function to load a saved game
  def initialize
    @guessed_letters = []
    @guesses = 8
    @secret_word = @@candidate_words.sample
    @guessed_word = Array.new(@secret_word.size, '_')
  end

  def display
    guess = ''
    @secret_word.size.times { |i| guess += " #{@guessed_word[i]} " }
    indexes = ''
    @secret_word.size.times { |i| indexes += " #{i + 1} " } # use (i + 1) so the index displays from 1
    puts "Guesses remaining: #{@guesses}"
    puts guess
    puts indexes
  end

  def play_game
    until @guesses.zero? || missing_letters.zero?
      letter = user_input
      update_guess letter
      @guesses -= 1
      display
    end
    puts "The secret word was #{@secret_word}!"
  end

  def missing_letters
    @guessed_word.reduce(0) do |acc, element|
      acc += 1 if element == '_'
      acc
    end
  end

  def update_guess(letter)
    (0..@secret_word.size).each do |i|
      @guessed_word[i] = letter if @secret_word.chars[i] == letter
    end
  end

  def user_input
    begin
      puts 'Enter a letter:'
      letter = gets.chomp
      raise StandardError.new("Can enter a single letter") unless letter.size == 1
      letter = letter.downcase.ord.chr
      raise StandardError.new("Input character must be a letter") unless letter.between?('a', 'z')
      raise StandardError.new("Already guessed this letter") if @guessed_letters.include?(letter)

      @guessed_letters << letter
      letter
    rescue StandardError => e
      puts e
      retry
    end
  end

  def self.select_candidate_words
    all_words = File.open 'google-10000-english-no-swears.txt'
    while word = all_words.gets
      word = word.chomp # remove the "/n" from the end of the word
      @@candidate_words.push(word) if word.size.between?(5, 8)
    end
    all_words.close
  end
end
