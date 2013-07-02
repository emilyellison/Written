require 'spec_helper'

feature 'inquiries' do
  
  before do
    visit new_inquiry_path
    fill_in 'inquiry_name', with: Faker::Name.name
    fill_in 'inquiry_email', with: Faker::Internet.email
    fill_in 'inquiry_message', with: Faker::Lorem.paragraph
  end
  
  scenario 'submit an invalid inquiry' do
        
    fill_in 'inquiry_email', with: nil
    click_button 'SEND'
        
    expect(current_path).to eq inquiries_path
    expect(page).to have_content 'Whoops! Something went wrong.'
    
  end
  
  scenario 'submit a valid inquiry' do
    
    click_button 'SEND'
    
    expect(current_path).to eq root_path
    expect(page).to have_content "Thanks for writing! I'll get back to you soon!"
    expect(last_email.subject).to eq "You've received an inquiry at Writ"
    
  end  
  
end