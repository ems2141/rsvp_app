require 'spec_helper'

feature 'Admin' do
  before do
    create_user(
        email: 'jake@example.com',
        password: 'hello123',
        admin: true)

    create_user(name: 'Tommy',
                email: 'tommy@test.com')

    create_user(name: 'Meg',
                email: 'meg@test.com')
  end

  scenario 'admin users can view list of registered guests' do
    visit '/login'
    fill_in 'Email', with: 'jake@example.com'
    fill_in 'Password', with: 'hello123'
    click_on 'Login'

    click_on 'View Guests'
    expect(page).to have_content 'Meg'
    expect(page).to have_content 'Tommy'
  end
end