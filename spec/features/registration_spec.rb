require 'spec_helper'

feature 'Registration' do
  scenario 'user can register' do
    visit '/'

    click_on "RSVP"
    fill_in 'Name', with: "Sally"
    fill_in 'Email', with: "sally@example.com"
    fill_in 'Wedding Password', with: "ellieandnick2015"
    fill_in 'Your Password', with: "hello123"
    click_button 'Yes!'

    expect(page).to have_content "Welcome Sally!"
  end

  scenario 'admin users can see a link to view a list of registered users' do
    create_user(admin: true)

    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    expect(page).to have_content "RSVP'ed Guests"
  end
end