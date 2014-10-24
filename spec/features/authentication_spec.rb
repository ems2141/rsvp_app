require 'spec_helper'

feature 'Authentication' do
  let(:user) { create_user }

  scenario 'users can login with correct email and password' do
    log_user_in(user.email, user.password)

    expect(page).to have_content 'Welcome Jake!'
  end

  scenario 'a users can logout' do
    log_user_in(user.email, user.password)

    click_on 'Logout'

    expect(page).to have_content 'You have been logged out'
  end

  scenario 'users cannot login with invalid email or password' do
    log_user_in('jake@test.com', user.password)

    expect(page).to have_content 'Invalid email or password'
  end

  def log_user_in(email = '', password = 'password')
    visit '/register/new'

    click_link 'Login Here'

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Login'
  end
end