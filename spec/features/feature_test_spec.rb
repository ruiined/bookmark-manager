# frozen_string_literal: true

feature 'testing bookmark manager' do
  scenario 'lists all bookmarks' do
    Bookmarks.add('http://testing_bookmarks.com')
    visit '/bookmarks'
    expect(page).to have_content('http://testing_bookmarks.com')
  end
end
