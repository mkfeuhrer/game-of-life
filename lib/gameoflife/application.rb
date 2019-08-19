require_relative '../game_of_life'

def predefined_input
  puts "Select a pattern :-\n" + "1) Block \n" + "2) Loaf \n" + "3) Boat \n" + "4) Toad \n" \
  "5) Pulsar\n" + "6) Pentadecathlon\n" + "7) Glider\n" \
  "8) LWSS \n"
  choice = gets.chomp.to_i
  value = Pattern.choose_pattern(choice)
  size = value.length
  board = GameOfLife::Board.new(size)
  board.update_board(value)
  board
end

def start_game(board)
  board.show_board
  game = GameOfLife::Game.new
  puts 'Enter number of iteration game of life needs to be executed'
  iteration_count = gets.chomp.to_i
  while iteration_count.positive?
    game.change_state(board)
    board.show_board
    iteration_count -= 1
  end
end

def start
  puts 'Welcome to game of life!'
  puts 'Enter 1 for predefined input, 2 for custom input'
  choice = gets.chomp.to_i
  return unless choice == 1

  board = predefined_input
  start_game(board)
end

start
