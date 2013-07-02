class Piece < ActiveRecord::Base
  
  # Gems
  mount_uploader :image, ImageUploader
  
  # Callbacks
  before_create :set_default_title
  
  # Attributes
  attr_accessible :description, :title, :image

  # Callback Methods
  def set_default_title
    self.title ||= File.basename(image.filename, '.*').titleize if image
  end
  
end
