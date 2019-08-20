module GameOfLife
  class Board
    attr_accessor :size, :life_board
    def initialize(size)
      @size = size
    end

    def board_size
      @size
    end

    def create_board
      @life_board = Array.new(@size) { Array.new(@size) { 0 } }
    end

    def update_board(board)
      @life_board = board
      @size = board.length
    end

    def fetch_board
      @life_board
    end

    def get_cell(row, col)
      @life_board[row][col]
    end

    def update_cell(row, col, value)
      @life_board[row][col] = value
    end

    def clear_screen
      puts "\033[H\033[2J"
    end

    def fetch_extreme_left
      extreme_left = @size
      (0..@size - 1).each do |row|
        (0..@size - 1).each do |col|
          extreme_left = [extreme_left, col].min if @life_board[row][col] == 1
        end
      end
      extreme_left
    end

    def fetch_extreme_right
      extreme_right = 0
      (0..@size - 1).each do |row|
        (0..@size - 1).each do |col|
          extreme_right = [extreme_right, col].max if @life_board[row][col] == 1
        end
      end
      extreme_right
    end

    def fetch_extreme_bottom
      extreme_bottom = 0
      (0..@size - 1).each do |row|
        (0..@size - 1).each do |col|
          extreme_bottom = [extreme_bottom, row].max if @life_board[row][col] == 1
        end
      end
      extreme_bottom
    end

    def fetch_extreme_top
      extreme_top = @size
      (0..@size - 1).each do |row|
        (0..@size - 1).each do |col|
          extreme_top = [extreme_top, row].min if @life_board[row][col] == 1
        end
      end
      extreme_top
    end

    def expand_right_bottom
      new_board = Array.new(@size + 1) { Array.new(@size + 1) { 0 } }
      (0..@size - 1).each do |row|
        (0..@size - 1).each do |col|
          new_board[row][col] = get_cell(row, col)
        end
      end
      update_board(new_board)
    end

    def expand_left_top
      new_board = Array.new(@size + 1) { Array.new(@size + 1) { 0 } }
      (0..@size - 1).each do |row|
        (0..@size - 1).each do |col|
          new_board[row + 1][col + 1] = get_cell(row, col)
        end
      end
      update_board(new_board)
    end

    def expand_board
      expand_left_top if fetch_extreme_top.zero? || fetch_extreme_left.zero?
      if @size - fetch_extreme_bottom == 1 ||
         @size - fetch_extreme_right == 1
        expand_right_bottom
      end
    end

    def show_board
      (0..@size - 1).each do |row|
        (0..@size - 1).each do |col|
          if @life_board[row][col] == 1
            print ' ▦'
          else
            print ' □'
          end
        end
        puts ''
      end
      sleep(0.2)
      clear_screen
    end
  end
end
