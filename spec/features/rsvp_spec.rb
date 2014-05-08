require 'spec_helper'

feature 'it has a welcome page' do
  scenario 'user can visit welcome page' do
    visit '/'
    expect(page).to have_content "Welcome to Ellie and Nick's Wedding Website"

    click_on "RSVP"
    expect(page).to have_content "Thank you for RSVP'ing!  Please fill in the information below..."
    fill_in 'name', with: "Sally"
    fill_in 'email', with: "sally@example.com"
    fill_in 'wedding_password', with: "ellieandnick2015"
    fill_in 'guest_password', with: "hello123"
    click_button 'Yes!'

    expect(page).to have_content "Welcome Sally!"
  end

  scenario 'User cannot register if password is less than 6 characters' do
    visit '/'
    click_link 'RSVP'

    fill_in 'name', with: "Sally"
    fill_in 'email', with: "sally@example.com"
    fill_in 'wedding_password', with: "ellieandnick2015"
    fill_in 'guest_password', with: "12"
    click_button 'Yes!'

    expect(page).to have_content 'Password is too short (minimum is 8 characters)'
  end

  scenario 'user cannot register without a valid email'
  scenario 'user can login with correct email and password'
  scenario 'user can RSVP'
  scenario 'users can be defined as admin'
  scenario 'admin users can view list of guests who have sent their rsvp'
end