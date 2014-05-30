require 'spec_helper'

feature 'it has a welcome page' do
  scenario 'user can visit welcome page' do
    visit '/'
    expect(page).to have_content "Welcome to Ellie and Nick's Wedding Website"

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
    user = User.new(
        name: "Jake",
        email: "jake@example.com",
        password: "hello123",
        wedding_password: "ellieandnick2015"
    )
    user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Name', with: 'Jake'
    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    expect(page).to have_content "Welcome Jake!"
  end

  scenario 'a user can logout' do
    user = User.new(
        name: "Jake",
        email: "jake@example.com",
        password: "hello123",
        wedding_password: "ellieandnick2015"
    )
    user.save!
    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Name', with: 'Jake'
    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    click_on 'Logout'
    expect(page).to have_content 'You have been logged out'
  end
end