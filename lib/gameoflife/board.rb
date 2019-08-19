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
      sleep(1)
      clear_screen
    end
  end
end
