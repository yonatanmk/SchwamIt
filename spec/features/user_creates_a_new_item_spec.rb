require "rails_helper"

feature "user creates a new item" do
  scenario "user can can navigate to the form from the index page" do

    visit items_path
    click_link "Add a new Thing"

    expect(page).to have_content "Submit a new 90s thing"
  end
  scenario "adds a 90s thing successfully" do
    visit new_item_path
    fill_in "Title", with: "Skip-It"
    fill_in "Description", with: "Easiest way to break your shins as a kid"
    click_button "Create Item"

    expect(page).to have_content "Skip-It"
    expect(page).to have_content "Easiest way to break your shins as a kid"
    expect(page).to have_link "Back"
  end
  scenario "adds a 90s thing unsuccessfully" do
    visit new_item_path
    fill_in "Title", with: "Skip-It"
    click_button "Create Item"

    expect(page).to have_content "Submit a new 90s thing"
    expect(find_field("Title").value).to eq "Skip-It"
  end
end
