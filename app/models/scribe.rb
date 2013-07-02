class Scribe < ActiveRecord::Base
  
  # Gems 
  has_secure_password
  
  # Attributes
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation
  
  # Validations
  validates_presence_of :first_name, :last_name, :email, :password_confirmation
  validates :email, email: true, uniqueness: { case_sensitive: false }
  
  # Callbacks
  before_save :downcase_email

  # Callback Methods
  def downcase_email
    self.email = email.downcase
  end
  
  # Instance Methods
  def name
    first_name + ' ' + last_name
  end
  
end
