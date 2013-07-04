require 'spec_helper'

feature "pieces" do
  
  before do
    5.times { create(:piece) }
    visit pieces_path
  end
  
  scenario "guest should see a thumb of all pieces" do
    page.should have_selector('img.thumb', count: 5)    
  end
  
  scenario "guest should see one large piece" do
    page.should have_selector('img.large', count: 1)    
  end

end



