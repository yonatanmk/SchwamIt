require 'rails_helper'

feature 'Sign Up' do
  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Username', with: 'birdman'
    fill_in 'Electronic Mail', with: 'birdie@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_button 'Sign Up'

    expect(page).to have_content("Whassup Dawg! You Have Successfully Signed In.")
    expect(page).to have_content("Sign Out")
    click_link 'Sign Out'
    expect(page).to have_content("Sign Up")
  end
end
