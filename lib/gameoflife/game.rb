module GameOfLife
  class Game
    def check_bounds(board, row, col)
      len = board.board_size
      return false if row >= len || row.negative?
      return false if col >= len || col.negative?

      true
    end

    def count_alive_neighbours(board, check_row, check_col)
      alive_neighbours = 0
      (-1..1).each do |row|
        (-1..1).each do |col|
          next if row.zero? && col.zero?

          if check_bounds(board, check_row + row, check_col + col) &&
             board.get_cell(check_row + row, check_col + col) == 1
            alive_neighbours += 1
          end
        end
      end
      alive_neighbours
    end

    def change_state(board)
      new_board = Array.new(board.board_size) { Array.new(board.board_size) }
      (0...board.board_size).each do |row|
        (0...board.board_size).each do |col|
          alive_neighbours = count_alive_neighbours(board, row, col)
          puts alive_neighbours
          state = 0
          new_board[row][col] = if state == 1
                                  1 - board.get_cell(row, col)
                                else
                                  board.get_cell(row, col)
                                end
        end
      end
      board.update_board(new_board)
    end
  end
end
