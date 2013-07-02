module LoginMacros
  
  def login scribe, options = {}
    
    email = options[:email] || scribe.email
    password = options[:password] || scribe.password
    
    visit pen_login_path
    fill_in 'email', with: email
    fill_in 'password', with: password
    click_button 'Log In'
    
  end
  
  def logout scribe
    login scribe
    visit pen_logout_path
  end
  
end