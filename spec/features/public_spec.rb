require 'spec_helper'

feature "public" do

  before do
    5.times { create(:piece) }
    visit root_path
  end
  
  scenario "guest can view all pieces" do
    page.should have_selector('img.piece', count: 5)    
  end

end