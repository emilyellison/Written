require 'spec_helper'

describe Piece do
  
  it "has a valid factory" do
    create(:piece).should be_valid
  end
  
  context 'methods' do
    
    before do
      3.times do
        piece = create(:piece)
        sleep 1
      end
    end
  
    it 'has a default scope that orders by most recently created' do
      Piece.first.id.should be > Piece.last.id
    end
  
    it 'has a method that returns the next most recently created' do
      piece = Piece.first
      expect(piece.next.id).to eq(piece.id - 1)
    end
  
    it 'has a method that returns the previous most recently created' do
      piece = Piece.last
      expect(piece.previous.id).to eq(piece.id + 1)
    end
  
  end
    
end
