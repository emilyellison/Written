require 'spec_helper'

feature 'sessions' do
  
  before { @scribe = create(:scribe) }
  
  scenario 'invalid email log in redirects to /pen/sessions' do
    login @scribe, email: 'my fake email'
    current_path.should eq pen_sessions_path
  end
  
  scenario 'invalid email log in displays error message' do
    login @scribe, email: 'my fake email'
    page.should have_content "Invalid login credentials."
  end
  
  scenario 'invalid password log in redirects to /pen/sessions' do
    login @scribe, password: 'my fake password'
    current_path.should eq pen_sessions_path
  end
  
  scenario 'invalid password log in displays error message' do
    login @scribe, password: 'my fake password'
    page.should have_content "Invalid login credentials."
  end
    
  scenario 'logging in should redirect to /pen/pieces' do
    login @scribe
    current_path.should eq pen_root_path
  end
  
  scenario 'logging in should display success message' do
    login @scribe
    page.should have_content 'Logged in!'
  end
  
  scenario 'logging out of the pen should redirect to /' do
    logout @scribe 
    current_path.should eq root_path
  end
  
  scenario 'logging out should display success message' do
    logout @scribe
    page.should have_content 'Logged out.'
  end
  
end