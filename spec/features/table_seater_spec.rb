require 'spec_helper'

feature 'it allows user to play with a table seating chart' do
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

  scenario 'admin user can submit a lists of people to be seated every other' do
    create_user(admin: true)

    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    click_on 'Table Seater'

    fill_in 'Guests', with: "Sam\nJoe\nJake\nCharlie\nJay\nJeff\nBob\nJohn"
    choose('seating_method_Seat_Every_Other')
    click_on 'Seat Now'

    expect(page).to have_content('Table 1: Sam, Jake, Jay, Bob, Joe, Charlie, Jeff, and John')
  end
end