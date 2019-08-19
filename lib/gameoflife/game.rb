module GameOfLife
  class Game
    def check_bounds(board, row, col)
      len = board.board_size
      return false if row >= len || row.negative?
      return false if col >= len || col.negative?

      true
    end

    def change_state(board)
      new_board = Array.new(board.board_size) { Array.new(board.board_size) }
      (0...board.board_size).each do |row|
        (0...board.board_size).each do |col|
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
