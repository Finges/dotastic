require 'spec_helper'

feature 'Deleting todos' do
  before do
    FactoryGirl.create(:todo, todo: "Test todo")
    visit '/'
    click_link 'Test todo'
  end
  
  scenario "Delete Todo" do
    click_link 'Delete Todo'
    expect(page).to have_content("Todo has been destroyed")
    visit '/'
    expect(page).to have_no_content("Test todo")
  end
end
