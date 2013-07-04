class PublicController < ApplicationController
  
  def index
    @pieces = Piece.all
  end
  
end