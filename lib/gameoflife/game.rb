module GameOfLife
  class Game
    def get_board(size)
      board = Array.new(size) { Array.new(size) }
      board
    end
  end
end
