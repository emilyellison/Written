APP_CONFIG = YAML.load_file("#{Rails.root}/config/email.yml")[Rails.env]

ActionMailer::Base.default_url_options = { host: APP_CONFIG['host'] }

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'fixitwithcode.com',
  :user_name            => APP_CONFIG['email'],
  :password             => APP_CONFIG['password'],
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}