require 'spec_helper'

feature "pieces" do
  
  before do
    5.times { create(:piece) }
    visit pieces_path
  end
  
  scenario "guest can view all pieces" do
    page.should have_selector('img.piece', count: 5)    
  end

end



