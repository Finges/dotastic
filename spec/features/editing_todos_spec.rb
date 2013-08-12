require 'spec_helper'

feature 'Editing Projects' do
  scenario 'Updating a todo' do
    FactoryGirl.create(:todo, todo: "Editing Todo")

    visit "/"
    click_link "Editing Todo"
    click_link "Edit Todo"
    fill_in "Todo", with: "Post Edited todo"
    click_button "Update Todo"

    expect(page).to have_content("Todo has been updated")
  end
end
