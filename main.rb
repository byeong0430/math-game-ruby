require './modules/game.rb'

# initiate Game class with 2 players
game = Game.new('Player 1', 'Player 2')
# play game until one of the two players' life is 0
game.play while !game.player1.life.zero? && !game.player2.life.zero?
