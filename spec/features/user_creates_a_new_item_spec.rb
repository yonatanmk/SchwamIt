require "rails_helper"

feature "user creates a new item" do
  scenario "user can can navigate to the form from the index page" do

    visit items_path
    click_link "Add a new Thing"

    expect(page).to have_content "Submit a new 90s thing"
  end
  scenario "adds a 90s thing successfully" do
    visit items_new_path
    fill_in "Title", with: "Skip-It"
    fill_in "Description", with: "Easiest way to break your shins as a kid"
    
  end
  scenario "adds a 90s thing unsuccessfully" do

  end
end
