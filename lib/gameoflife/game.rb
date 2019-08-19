module GameOfLife
  class Game
    def get_board(size)
      board = Array.new(size) { Array.new(size) }
      board
    end

    def start
      board = get_board(5)
      puts 'Welcome to game of life'
      puts board.length
    end
  end
end

game = GameOfLife::Game.new
game.start
