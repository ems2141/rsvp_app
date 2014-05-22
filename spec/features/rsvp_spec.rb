require 'spec_helper'

feature 'it has a welcome page' do
  scenario 'user can visit welcome page' do
    visit '/'
    expect(page).to have_content "Welcome to Ellie and Nick's Wedding Website"

    click_on "RSVP"
    expect(page).to have_content "Thank you for RSVP'ing!  Please fill in the information below..."
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
    pending
    User.create(name: "Jake", email: "jschneiders@nyx.com", password: "hello123")
    visit '/rsvp'
    click_link 'Login Here'

    fill_in 'Name', with: 'Jake'
    fill_in 'Email', with: 'jschneiders@nyx.com'
    fill_in 'Your Password', with: 'hello123'
    click_on 'Login'

    expect(page).to have_content "Welcome Jake!"
  end

  scenario 'user can RSVP'
  scenario 'users can be defined as admin'
  scenario 'admin users can view list of guests who have sent their rsvp'
end