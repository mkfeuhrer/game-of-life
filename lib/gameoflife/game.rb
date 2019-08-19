module GameOfLife
  class Game
    def check_bounds(board, row, col)
      len = board.board_size
      return false if row >= len || row.negative?
      return false if col >= len || col.negative?

      true
    end
  end
end
