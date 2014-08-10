require 'spec_helper'

feature 'Authentication' do
  scenario 'users can login with correct email and password' do
    user = new_user
    user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    expect(page).to have_content "Welcome Jake!"
  end

  scenario 'a users can logout' do
    user = new_user
    user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    click_on 'Logout'
    expect(page).to have_content 'You have been logged out'
  end

  scenario 'users cannot login with invalid email or password' do
    user = new_user
    user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@test.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'
    expect(page).to have_content 'Invalid email or password'
  end

end