require "rails_helper"

feature "user edits their account" do

  before(:each) do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'birdman'
    fill_in 'Electronic Mail', with: 'birdie@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_button 'Sign Up'
    click_link 'Edit Account'
  end

  scenario "user can navigate to the edit account page" do
    expect(page).to have_content "Edit User"
  end

  scenario "user can edit username/email/password" do
    fill_in "Username", with: "catman"
    fill_in "Electronic Mail", with: "fishman@gmail.com"
    fill_in "New Password", with: "fishman"
    fill_in "New Password Confirmation", with: "fishman"
    fill_in "Current password", with: 'password'
    click_button "Update"


    expect(page).to have_content "Your account has been updated successfully"
    click_link 'Edit Account'
    expect(find_field("Username").value).to eq "catman"
    expect(find_field("Electronic Mail").value).to eq "fishman@gmail.com"
    click_link 'Sign Out'
    click_link 'Sign In'

    fill_in 'Electronic Mail', with: 'fishman@gmail.com'
    fill_in 'Password', with: 'fishman'
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

  scenario "user can delete their account" do
    click_link "Cancel yo account"
    expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
    expect(User.all.length).to eq(0)
  end
end
