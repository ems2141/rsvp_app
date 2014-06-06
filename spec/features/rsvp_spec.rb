require 'spec_helper'

feature 'it has a welcome page' do
  scenario 'user can visit welcome page' do
    visit '/'

    click_on "RSVP"
    fill_in 'Name', with: "Sally"
    fill_in 'Email', with: "sally@example.com"
    fill_in 'Wedding Password', with: "ellieandnick2015"
    fill_in 'Your Password', with: "hello123"
    click_button 'Yes!'

    expect(page).to have_content "Welcome Sally!"
  end

  scenario 'User cannot register if password is less than 6 characters' do
    visit '/'
    click_link 'RSVP'

    fill_in 'Name', with: "Sally"
    fill_in 'Email', with: "sally@example.com"
    fill_in 'Wedding Password', with: "ellieandnick2015"
    fill_in 'Your Password', with: "12"
    click_button 'Yes!'

    expect(page).to have_content 'Password is too short (minimum is 8 characters)'
  end

  scenario 'user can login with correct email and password' do
    user = new_user
    user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    expect(page).to have_content "Welcome Jake!"
  end

  scenario 'a user can logout' do
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

  scenario 'user cannot login with invalid email or password' do
    user = new_user
    user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@test.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'
    expect(page).to have_content 'Invalid email or password'
  end

  scenario 'user can be designated as admin and click link to see a list of registered users' do
    admin_user = new_user(admin: true)
    admin_user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    expect(page).to have_content 'Welcome Jake!'
    expect(page).to have_content 'RSVP\'ed Guests'
  end

  scenario 'non-admin users should not see table seater link' do
    user = new_user
    user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    expect(page).to have_no_content 'Table Seater'
  end
end