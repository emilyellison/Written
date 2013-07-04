class Piece < ActiveRecord::Base
  
  # Gems
  mount_uploader :image, ImageUploader
  
  # Scopes
  default_scope order('created_at DESC')
  
  # Callbacks
  before_create :set_default_title
  
  # Attributes
  attr_accessible :description, :title, :image

  # Callback Methods
  def set_default_title
    self.title ||= File.basename(image.filename, '.*').titleize if image
  end
  
  # Instance Methods
  def next
    Piece.where("created_at < ?", self.created_at).first
  end
  
  def previous
    Piece.where("created_at > ?", self.created_at).last
  end
  
end
