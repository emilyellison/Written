class Inquiry < ActiveRecord::Base
  
  # Scopes
  scope :most_recent, order('created_at desc')
  
  # Attributes
  attr_accessible :email, :message, :name, :reply
  
  # Validations
  validates_presence_of :email, :message
  validates :email, email: true
  validates :reply, presence: true, on: :update
    
end
