require "rails_helper"

feature "user visits index page" do


  before(:each) do
    user = FactoryGirl.create(:user)
    10.times { FactoryGirl.create(:item, user: user) }
    FactoryGirl.create(:item, title: "Dragonball Z", user: user)
    FactoryGirl.create(:item, title: "Dragonball GT", user: user)
    visit items_path
  end

  scenario "user searches for a unique item" do
    fill_in "search", with: "Dragonball Z"
    click_button "Search"

    expect(page).to_not have_content "Pokemon"
    expect(page).to have_content "Dragonball Z"
  end

  scenario "user searches with a non-unique query" do
    fill_in "search", with: "Dragonball"
    click_button "Search"

    expect(page).to have_content "Dragonball Z"
    expect(page).to have_content "Dragonball GT"
    expect(page).to_not have_content "Pokemon"
  end

  scenario "user searches for a query with no results" do
    fill_in "search", with: "Power Rangers"
    click_button "Search"

    expect(page).to_not have_content "Pokemon"
    expect(page).to_not have_content "Dragonball"
  end

  scenario "user does a case-insensitive search" do
    fill_in "search", with: "z"
    click_button "Search"

    expect(page).to have_content "Dragonball Z"
  end
end
