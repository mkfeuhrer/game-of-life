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

def custom_input
  value = Array.new(20) { Array.new(20) { 0 } }
  puts 'Enter no. of live cells initially'
  number_of_live_cells = gets.to_i
  (0...number_of_live_cells).each do |_cells|
    puts 'Enter row and col of live cell :'
    input = gets.chomp.split(' ').map(&:to_i)
    row = input[0]
    col = input[1]
    value[row][col] = 1
  end
  board = GameOfLife::Board.new(20)
  board.update_board(value)
  board
end

def start_game(board)
  board.show_board
  game = GameOfLife::Game.new
  board.expand_board if game.board_expansion_required(board)
  puts 'Enter number of iteration game of life needs to be executed'
  iteration_count = gets.chomp.to_i
  count = 0
  while iteration_count.positive?
    puts 'Iteration Count ', count
    board.expand_board if game.board_expansion_required(board)
    game.change_state(board)
    board.show_board
    iteration_count -= 1
    count += 1
  end
end

def start
  puts 'Welcome to game of life!'
  puts 'Enter 1 for predefined input, 2 for custom input'
  choice = gets.chomp.to_i
  board = if choice == 1
            predefined_input
          else
            custom_input
          end
  start_game(board)
end

start
