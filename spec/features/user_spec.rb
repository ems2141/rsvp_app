require 'spec_helper'

describe 'User functionality' do
  it 'has a photo album' do
    user = create_user(email: 'test@example.com', password: 'password')
    log_user_in(user.email)

    click_on 'Photo Gallery'

    page.should have_css("img")
  end

  def log_user_in(email)
    visit '/login'
    fill_in 'Email', with: email
    fill_in 'Password', with: 'password'
    click_on 'Login'
  end
end
