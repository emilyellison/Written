class Gallery < ActiveRecord::Base
  
  # Attributes
  attr_accessible :name
  
  # Validations
  validates_presence_of :name
  
end
