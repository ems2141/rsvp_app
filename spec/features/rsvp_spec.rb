require 'spec_helper'

feature 'it has a welcome page' do
  scenario 'user can visit welcome page' do
    visit '/'
    save_and_open_page
    expect(page).to have_content "Welcome to Ellie and Nick's Wedding Website"
  end
end