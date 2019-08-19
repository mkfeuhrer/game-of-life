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

  describe '#change_state' do
    context 'when change state called' do
      it 'returns updated state of life' do
        new_game, new_board = create_game
        expected_board = Array.new(5) { Array.new(5) { 0 } }
        new_game.change_state(new_board)
        expect(new_board.fetch_board).to match_array(expected_board)
      end
    end
  end

  describe '#count_alive_neighbours' do
    context 'When count_alive_neighbours called' do
      it 'returns number of live neighbours' do
        new_game, new_board = create_game
        new_board.update_cell(0, 0, 1)
        expect(new_game.count_alive_neighbours(new_board, 1, 0)).to eq(1)
      end
    end
  end
end
