def create_game
  new_game = GameOfLife::Game.new
  new_board = GameOfLife::Board.new(5)
  new_board.create_board
  [new_game, new_board]
end

RSpec.describe GameOfLife::Game do
  describe '#check_bounds' do
    context 'When row is out of bound' do
      it 'should return false' do
        new_game, new_board = create_game
        expect(new_game.check_bounds(new_board, -1, 0)).to eq(false)
      end
    end

    context 'When col is out of bound' do
      it 'should return false' do
        new_game, new_board = create_game
        expect(new_game.check_bounds(new_board, 0, -1)).to eq(false)
      end
    end

    context 'When both row and col are out of bound' do
      it 'should return false' do
        new_game, new_board = create_game
        expect(new_game.check_bounds(new_board, -1, -1)).to eq(false)
      end
    end

    context 'When row and col are within bounds' do
      it 'should return true' do
        new_game, new_board = create_game
        expect(new_game.check_bounds(new_board, 0, 0)).to eq(true)
      end
    end
  end
end
