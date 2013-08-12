require 'spec_helper'

feature 'Creating Todos' do
  before do
    visit '/'
    click_link 'New Todo'
  end

  scenario 'can create a todo' do
    fill_in 'Todo', :with => 'Test todo'
    click_button 'Create Todo'
    page.should have_content('Todo has been created.')
  end

  scenario 'Can not create a blank todo' do
    click_button 'Create Todo'
    page.should have_content('Todo has not been created')
    page.should have_content("Todo can't be blank")
  end
end
