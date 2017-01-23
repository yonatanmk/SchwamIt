require 'rails_helper'

feature 'Sign in' do
  scenario 'an existing user specifies a valid email and password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'

    fill_in 'Electronic Mail', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Whassup Dawg! Welcome Back!")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")
    click_link 'Sign Out'
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'a nonexistant email and password is supplied' do
    visit root_path
    click_link 'Sign In'
    fill_in 'Electronic Mail', with: 'nonbody@gmail.com'
    fill_in 'Password', with: 'wrbdstdaetnat'
    click_button 'Sign In'
    expect(page).to have_content("Invalid Electronic Mail or Password")
    expect(page).to_not have_content("Whassup Dawg! Welcome Back!")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Sign In")
  end

  scenario 'an existing email and wrong password is denied access' do
    user = FactoryGirl.create(:user)

    visit root_path
    click_link 'Sign In'
    fill_in 'Electronic Mail', with: user.email
    fill_in 'Password', with: 'wrbdstdaetnat'
    click_button 'Sign In'
    expect(page).to have_content("Invalid Electronic Mail or Password")
    expect(page).to_not have_content("Whassup Dawg! Welcome Back!")
    expect(page).to_not have_content("Sign Out")
    expect(page).to have_content("Sign In")
  end

  scenario 'an already authenticated user cannot re-sign in' do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Electronic Mail', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign Up")
    expect(page).to_not have_content("Sign In")

    visit new_user_session_path
    save_and_open_page
    expect(page).to have_content("You are already signed in dawg.")
  end


end
