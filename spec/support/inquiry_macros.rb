module InquiryMacros
  
  def submit_reply
    visit pen_inquiries_path
    click_link "Reply"
    fill_in 'inquiry_reply', with: Faker::Lorem.paragraph
    click_button "SEND"
  end
  
  def submit_invalid_reply 
    visit pen_inquiries_path
    click_link "Reply"
    fill_in 'inquiry_reply', with: nil
    click_button "SEND"
    page.driver.browser.switch_to.alert.accept
  end
  
end

