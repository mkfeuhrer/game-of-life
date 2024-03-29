module GameOfLife
  class Game
    def check_bounds(board, row, col)
      len = board.board_size
      return false if row >= len || row.negative?
      return false if col >= len || col.negative?

      true
    end

    def get_state(alive_neighbours, value)
      if value == 1
        if alive_neighbours >= 2 && alive_neighbours < 4
          0
        else 1
        end
      elsif value.zero?
        if alive_neighbours == 3
          1
        else 0
        end
      else
        -1
      end
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
          state = get_state(alive_neighbours, board.get_cell(row, col))
          new_board[row][col] = if state == 1
                                  1 - board.get_cell(row, col)
                                else
                                  board.get_cell(row, col)
                                end
        end
      end
      board.update_board(new_board)
    end

    def board_expansion_required(board)
      if board.board_size - board.fetch_extreme_bottom == 1 ||
         board.board_size - board.fetch_extreme_right == 1 ||
         board.fetch_extreme_top.zero? ||
         board.fetch_extreme_left.zero?
        true
      else
        false
      end
    end
  end
end
