require 'spec_helper'

feature 'it has a welcome page' do
  scenario 'user can visit welcome page' do
    visit '/'
    expect(page).to have_content "Welcome to Ellie and Nick's Wedding Website"

    click_on "RSVP Now"
    expect(page).to have_content "Thank you for RSVP'ing!  Please fill in the information below..."
    fill_in 'name', with: "Sally"
    fill_in 'email', with: "sally@example.com"
    fill_in 'password', with: "ellieandnick2015"
    click_button 'Yes!'

    expect(page).to have_content "Thank you for responding Sally!"

  end


end