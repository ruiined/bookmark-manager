# frozen_string_literal: true

feature 'testing bookmark manager' do
  scenario 'lists all bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content('http://makersacademy.com')
  end
end
