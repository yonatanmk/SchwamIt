require "rails_helper"

feature "user edits their account" do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
    visit root_path
    click_link "Edit Account"
  end

  scenario "user can navigate to the edit account page" do
    expect(page).to have_content "Edit User"
  end

  scenario "user can edit username/email/password" do
    fill_in "Username", with: "birdman"
    fill_in "Electronic Mail", with: "fishman@gmail.com"
    fill_in "New Password", with: "fishman"
    fill_in "New Password Confirmation", with: "fishman"
    binding.pry
    fill_in "Current password", with: User.first.password
    click_button "Update"


    expect(page).to have_content "Your account has been updated successfully"
    click_link "Edit Account"
    expect(page).to have_content "birdman"
    expect(page).to have_content "fishman@gmail.com"
  end
  # scenario "User leaves Description blank" do
  #   visit new_item_path
  #   fill_in "Title", with: "Skip-It"
  #   click_button "Create Item"
  #
  #   expect(page).to have_content "Description can't be blank"
  #   expect(page).to have_content "Submit a new 90s thing"
  #   expect(find_field("Title").value).to eq "Skip-It"
  # end
  #
  # scenario "User leaves Title blank" do
  #   visit new_item_path
  #   fill_in "Description", with: "Easiest way to break your shins as a kid"
  #   click_button "Create Item"
  #
  #   expect(page).to have_content "Title can't be blank"
  #   expect(page).to have_content "Submit a new 90s thing"
  #   expect(find_field("Description").value).to eq "Easiest way to break your shins as a kid"
  # end
  #
  # scenario "User leaves both fields blank" do
  #   visit new_item_path
  #   click_button "Create Item"
  #
  #   expect(page).to have_content "Description can't be blank"
  #   expect(page).to have_content "Title can't be blank"
  # end
end
