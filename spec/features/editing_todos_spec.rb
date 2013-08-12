require 'spec_helper'

feature 'Editing Projects' do
  before do
    FactoryGirl.create(:todo, todo: "Editing Todo")
    visit "/"
    click_link "Editing Todo"
    click_link "Edit Todo"
  end

  scenario 'Updating a todo' do
    fill_in "Todo", with: "Post Edited todo"
    click_button "Update Todo"
    expect(page).to have_content("Todo has been updated")
  end

  scenario 'Updating to blank todo' do
    fill_in "Todo", with: ""
    click_button "Update Todo"
    expect(page).to have_content("Todo has not been updated.")
  end


end
