require 'spec_helper'

feature 'it allows users to play with a table seating chart' do
  scenario 'non-admin users should not see table seater link' do
    log_in_user(create_user)

    expect(page).to have_no_content 'Table Seater'
  end

  scenario 'admin users can submit a lists of people to be seated every other' do
    log_in_user(create_user(admin: true))

    click_on 'Table Seater'

    fill_in 'Guests', with: "Sam\nJoe\nJake\nCharlie\nJay\nJeff\nBob\nJohn"
    choose('seating_method_Seat_Every_Other')
    click_on 'Seat Now'

    expect(page).to have_content('Table 1: Sam, Jake, Jay, Bob, Joe, Charlie, Jeff, and John')
  end

  def log_in_user(user)
    visit '/register/new'

    click_link 'Login Here'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Login'
  end
end