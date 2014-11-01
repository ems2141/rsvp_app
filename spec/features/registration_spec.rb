require 'spec_helper'

feature 'Registration' do
  scenario 'users can register' do
    visit '/register/new'

    fill_in 'Name', with: 'Sally'
    fill_in 'Email', with: 'sally@example.com'
    fill_in 'Password', with: 'hello123'
    click_button 'Yes!'

    expect(page).to have_content 'Welcome Sally!'
  end
end