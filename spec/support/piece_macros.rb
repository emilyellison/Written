module PieceMacros
  
  def upload_piece options = {}
    file = options[:file] || 'rails.png'
    attach_file 'piece_image', Rails.root + 'spec/fixtures/files/' + file
    begin
      page.should have_selector('img')
    rescue Selenium::WebDriver::Error::UnhandledAlertError
      page.driver.browser.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
    end
  end
  
  def update_piece
    create(:piece)
    visit pen_pieces_path
    fill_in 'piece_title', with: "This is not a pipe."
    fill_in 'piece_description', with: "Yes it is."
    click_button 'SAVE'
    visit pen_pieces_path
  end
  
end