require "rails_helper"

feature "user creates a new item" do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user
  end

  scenario "user can navigate to the form from the index page" do
    visit root_path
    click_link "Add a new Thing"

    expect(page).to have_content "Submit a new 90s thing"
  end
  scenario "adds a 90s thing successfully" do
    visit new_item_path
    fill_in "Title", with: "Skip-It"
    fill_in "Description", with: "Easiest way to break your shins as a kid"
    click_button "Create Item"

    expect(page).to have_content "You made a Thing"
    expect(page).to have_content "Skip-It"
    expect(page).to have_content "Easiest way to break your shins as a kid"
    expect(page).to have_link "Back"
  end
  scenario "User leaves Description blank" do
    visit new_item_path
    fill_in "Title", with: "Skip-It"
    click_button "Create Item"

    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Submit a new 90s thing"
    expect(find_field("Title").value).to eq "Skip-It"
  end

  scenario "User leaves Title blank" do
    visit new_item_path
    fill_in "Description", with: "Easiest way to break your shins as a kid"
    click_button "Create Item"

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Submit a new 90s thing"
    expect(find_field("Description").value).to eq "Easiest way to break your shins as a kid"
  end

  scenario "User leaves both fields blank" do
    visit new_item_path
    click_button "Create Item"

    expect(page).to have_content "Description can't be blank"
    expect(page).to have_content "Title can't be blank"
  end
end
