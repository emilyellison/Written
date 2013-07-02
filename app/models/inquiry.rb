class Inquiry < ActiveRecord::Base
  
  # Scopes
  scope :most_recent, order('created_at desc')
  scope :replied, where('reply IS NOT NULL')
  scope :need_reply, where('reply IS NULL')
  
  # Attributes
  attr_accessible :email, :message, :name, :reply
  
  # Validations
  validates_presence_of :email, :message
  validates :email, email: true
  validates :reply, presence: true, on: :update
    
  # Class Methods
  def self.filter_by(params)
    if params[:replied]
      params[:replied] == 'true' ? replied : need_reply
    else
      scoped
    end
  end  
  
end
