RSpec.describe GameOfLife::Game do
  describe '#get_board' do
    context 'when get board is called' do
      it 'returns current state of life' do
        new_game = GameOfLife::Game.new
        new_board = Array.new(5) { Array.new(5) }
        expect(new_game.get_board(5)).to eq(new_board)
      end
    end
  end
end
