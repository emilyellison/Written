class PiecesController < ApplicationController
  
  def index
    @pieces = Piece.all
    @piece = Piece.first
  end
  
  def show
    @pieces = Piece.all
    @piece = Piece.find(params[:id])
  end

end