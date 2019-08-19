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
end
