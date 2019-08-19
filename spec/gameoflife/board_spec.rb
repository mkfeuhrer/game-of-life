RSpec.describe GameOfLife::Board do
  describe '#update_cell' do
    context 'When update_cell is called it' do
      it 'updates cell state' do
        board = GameOfLife::Board.new(5)
        board.create_board
        board.update_cell(0, 0, 1)
        expect(board.get_cell(0, 0)).to eq(1)
      end
    end
  end

  describe '#update_board' do
    context 'When update_board is called it' do
      it 'updates cell state' do
        board = GameOfLife::Board.new(5)
        board.create_board
        board.update_cell(0, 0, 1)
        board.update_board(board.fetch_board)
        expect(board.get_cell(0, 0)).to eq(1)
      end
    end
  end

  describe '#create_board' do
    context 'when get board is called' do
      it 'returns current state of life' do
        board = GameOfLife::Board.new(5)
        board.create_board
        new_board = Array.new(5) { Array.new(5) { 0 } }
        expect(board.fetch_board).to eq(new_board)
      end
    end
  end

  describe '#get_extreme_left' do
    context 'when get extreme left is called' do
      it 'returns leftmost column with live cell' do
        board = GameOfLife::Board.new(5)
        board.create_board
        board.update_cell(1, 1, 1)
        expect(board.fetch_extreme_left).to eq(1)
        board.update_cell(2, 0, 1)
        expect(board.fetch_extreme_left).to eq(0)
      end
    end
  end

  describe '#get_extreme_right' do
    context 'when get extreme right is called' do
      it 'returns rightmost column with live cell' do
        board = GameOfLife::Board.new(5)
        board.create_board
        board.update_cell(1, 3, 1)
        expect(board.fetch_extreme_right).to eq(3)
        board.update_cell(2, 4, 1)
        expect(board.fetch_extreme_right).to eq(4)
      end
    end
  end

  describe '#get_extreme_bottom' do
    context 'when get extreme bottom is called' do
      it 'returns bottommost column with live cell' do
        board = GameOfLife::Board.new(5)
        board.create_board
        board.update_cell(3, 1, 1)
        expect(board.fetch_extreme_bottom).to eq(3)
        board.update_cell(4, 3, 1)
        expect(board.fetch_extreme_bottom).to eq(4)
      end
    end
  end

  describe '#get_extreme_top' do
    context 'when get extreme top is called' do
      it 'returns topmost column with live cell' do
        board = GameOfLife::Board.new(5)
        board.create_board
        board.update_cell(1, 1, 1)
        expect(board.fetch_extreme_top).to eq(1)
        board.update_cell(0, 3, 1)
        expect(board.fetch_extreme_top).to eq(0)
      end
    end
  end

  describe '#expand_right_bottom' do
    context 'when expand grid is called with right or bottom side' do
      it 'returns expanded board' do
        board = GameOfLife::Board.new(5)
        board.create_board
        board.update_cell(4, 4, 1)
        board.expand_board
        new_board = GameOfLife::Board.new(6)
        new_board.create_board
        new_board.update_cell(4, 4, 1)
        expect(board.fetch_board).to eq(new_board.fetch_board)
      end
    end
  end

  describe '#expand_left_top' do
    context 'when expand grid is called with left or top side' do
      it 'returns expanded board' do
        board = GameOfLife::Board.new(5)
        board.create_board
        board.update_cell(0, 0, 1)
        board.expand_board
        new_board = GameOfLife::Board.new(6)
        new_board.create_board
        new_board.update_cell(1, 1, 1)
        expect(board.fetch_board).to eq(new_board.fetch_board)
      end
    end
  end
end
