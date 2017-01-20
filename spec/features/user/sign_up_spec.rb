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
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("Something Went Wrong. That's Whack!")
    expect(page).to have_content("Please Specify A Username.")
    expect(page).to have_content("Please Specify An Electronic Mail.")
    expect(page).to have_content("Please Specify A Password.")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Username', with: 'birdman'
    fill_in 'Electronic Mail', with: 'birdie@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Confirm Password', with: 'not password'
    click_button 'Sign Up'

    expect(page).to have_content("Something Went Wrong. That's Whack!")
    expect(page).to have_content("Password Does Not Match")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'invalid email supplied' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Electronic Mail', with: 'birdie@gmailcom'
    click_button 'Sign Up'

    expect(page).to have_content("Something Went Wrong. That's Whack!")
    expect(page).to have_content("Please Specify A Valid Electronic Mail.")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password is too short' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'user_password', with: '123'
    click_button 'Sign Up'

    expect(page).to have_content("Something Went Wrong. That's Whack!")
    expect(page).to have_content("Password Is Too Short (6 Characters Minimum)")
    expect(page).to_not have_content("Sign Out")
  end
end
