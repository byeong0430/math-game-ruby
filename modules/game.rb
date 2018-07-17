require_relative './player.rb'
require_relative './question.rb'

class Game
  attr_accessor :player1, :player2
  def initialize(player1_name, player2_name)
    # initialise Game class with 2 players each of whom has 3 lives
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @total_turn = 0 # set initial turn as 0
    @current_player = 'player1'
  end

  # dynamically call player class
  def who_is_playing
    instance_variable_get("@#{@current_player}")
  end

  # print question
  def announce_question
    # get the first and second numbers
    first_number = @question.number[:number1]
    second_number = @question.number[:number2]
    puts "#{who_is_playing.name}: What does #{first_number} plus #{second_number} equal?"
  end

  # display score board
  def show_score_board
    puts "P1: #{@player1.life}/#{@player1.max_life} vs P2: #{@player2.life}/#{@player2.max_life}"
  end

  # correct answer logic
  def correct_a_statement
    puts 'YES! You are correct.'
    show_score_board
  end

  # incorrect answer logic
  def incorrect_a_statement
    # execute take_life method
    who_is_playing.take_life

    puts "#{who_is_playing.name}: Seriously? No!"
    show_score_board
  end

  def announce_winner
    puts "#{who_is_playing.name} wins with a score of #{who_is_playing.life}/#{who_is_playing.max_life}"
    puts '----- GAME OVER -----'
    puts 'Good bye!'
  end

  def switch_player
    @current_player = @current_player == 'player1' ? 'player2' : 'player1'
  end

  def play
    # for each play, initialize new question and add two numbers
    @question = Question.new
    @question.add_numbers

    # announce the question
    announce_question

    # check if the answer is correct and print an appropriate statement
    gets.chomp.to_i == @question.number[:answer] ? correct_a_statement : incorrect_a_statement

    # after every turn, switch player
    switch_player

    # if any player's life is zero, announce the winner and end the game
    # otherwise, next turn!
    (@player1.life.zero? || @player2.life.zero?) ? announce_winner : (puts '----- NEW TURN -----')
  end
end
