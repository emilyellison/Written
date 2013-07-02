class Pen::PiecesController < Pen::ApplicationController
  
  def index
    @pieces = Piece.all
  end
  
  def create
    @piece = Piece.create(params[:piece])
  end
  
  def update
    @piece = Piece.find(params[:id])
    @piece.update_attributes(params[:piece])
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

end