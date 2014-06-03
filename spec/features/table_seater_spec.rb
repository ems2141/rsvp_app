require 'spec_helper'

feature 'it allows user to play with a table seating chart' do
  scenario 'user can submit a lists of people to be seated every other' do
    User.create!(
        name: "Jake",
        email: "jake@example.com",
        password: "hello123",
        wedding_password: "ellieandnick2015"
    )

    visit '/rsvp'

    click_link 'Login Here'

    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    expect(page).to have_content "Welcome Jake!"

    click_on 'Table Seater'

    fill_in 'Guests', with: "Sam\nJoe\nJake\nCharlie\nJay\nJeff\nBob\nJohn"
    choose('seating_method_Seat_Every_Other')
    click_on 'Seat Now'

    expect(page).to have_content('Table 1: Sam, Jake, Jay, Bob, Joe, Charlie, Jeff, and John')

    # users who have created a new table seating can click a link to go back to the welcome page
    click_on 'Home'
    expect(page).to have_content "Welcome Jake!"
  end
end