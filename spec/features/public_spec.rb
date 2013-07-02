require 'spec_helper'

feature "public" do
  
  before { visit root_path }

  scenario "should have the brand link WRIT" do
    page.should have_selector('a.brand', text: 'WRIT')
  end

  scenario "should have the link to the Gallery page" do
    page.should have_selector('a', text: 'Gallery')
  end
  
  scenario "should have the link to the Contact page" do
    page.should have_selector('a', text: 'Contact')
  end

end