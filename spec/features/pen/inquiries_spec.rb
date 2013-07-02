require 'spec_helper'

feature "inquiries" do

  before do
    scribe = create(:scribe)
    login(scribe)
    @inquiry = create(:inquiry)
  end
  
  scenario "scribe sees a reply link before replying" do
    visit pen_inquiries_path
    page.should have_selector('a', text: 'Reply')
  end
  
  scenario "scribe does not see 'Replied' text before replying" do
    visit pen_inquiries_path
    page.should_not have_selector('div.pull-right', text: 'Replied')
  end
  
  scenario "scribe sees a reply link after submitting an invalid reply" do
    submit_invalid_reply
    page.should have_selector('a', text: 'Reply')    
  end
  
  scenario "scribe does not see 'Replied' text after submitting an invalid reply" do
    submit_invalid_reply
    page.should_not have_selector('div.pull-right', text: 'Replied')    
  end
  
  scenario "scribe does not receive an email after submitting an invalid reply" do
    submit_invalid_reply
    expect(last_email).to be_nil
  end
  
  scenario "scribe does not see a reply link after submitting a valid reply" do
    submit_reply
    page.should_not have_selector('a', text: 'Reply')
  end
  
  scenario "scribe does see 'Replied' text after submitting a valid reply" do
    submit_reply
    page.should have_selector('div.pull-right', text: 'Replied')
  end
  
  scenario "scribe receives an email after submitting a valid reply" do
    submit_reply
    page.should have_content('Replied')
    expect(last_email).to be_present
  end
  
  scenario "scribe can view an inquiry on the index page" do
    visit pen_inquiries_path
    page.should have_content(@inquiry.name)
    page.should have_content(@inquiry.email)
    page.should have_selector('p', text: @inquiry.message)
  end

end
