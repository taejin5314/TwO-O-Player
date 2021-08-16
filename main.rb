require_relative 'game'
require_relative 'player'
require_relative 'question'

$player1 = Player.new('Player 1')
$player2 = Player.new('Player 2')
$game = Game.new
$question = Question.new

def new_game
  puts "#{$game.turn}: #{$question.generate}"
  print "> "
  answer = gets.chomp

  if $question.check(answer)
    puts "#{$game.turn}: YES! You are correct."
  else
    puts "#{$game.turn}: Seriously? No!"
    ($game.turn == "Player 1") ? $player1.lose : $player2.lose
  end

  if $player1.lives < 1 || $player2.lives < 1
    puts ($game.turn == "Player 1") ? $player2.win_message : $player1.win_message
    puts "----- GAME OVER -----"
    puts "Good bye!"
  else
    puts "#{$player1.info} vs #{$player2.info}"
    $game.switch
    puts "----- NEW TURN -----"
    new_game
  end
end

new_game