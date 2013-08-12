require 'spec_helper'

feature 'Viewing todos' do
  scenario "Listing all todos" do
    todo = FactoryGirl.create(:todo, todo: "Todo 1")
    visit '/'
    click_link 'Todo 1'
    expect(page.current_url).to eql(todo_url(todo))
  end
end
