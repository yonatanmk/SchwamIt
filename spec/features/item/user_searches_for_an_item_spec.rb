require "rails_helper"

feature "user visits index page" do

  before(:each) do
    user = FactoryGirl.create(:user)
    10.times { FactoryGirl.create(:item, user: user) }
    FactoryGirl.create(:item, title: "Dragonball Z", user: user)
    visit items_path
  end

  after(:each) do
    DatabaseCleaner.clean
  end

  scenario "user searches for a unique item" do
    fill_in "search", with: "Pokemon2"
    click_button "Search"

    expect(page).to have_content "Pokemon2"
    expect(page).to_not have_content "Pokemon1"
    (3..10).each do |n|
      expect(page).to_not have_content "Pokemon#{n}"
    end
    expect(page).to_not have_content "Dragonball Z"
  end

  scenario "user searches with a non-unique query" do
    fill_in "search", with: "Pokemon"
    click_button "Search"

    (1..10).each do |n|
      expect(page).to have_content "Pokemon#{n}"
    end
    expect(page).to_not have_content "Dragonball Z"
  end

  scenario "user searches for a query with no results" do
    fill_in "search", with: "Power Rangers"
    click_button "Search"

    (1..10).each do |n|
      expect(page).to_not have_content "Pokemon#{n}"
    end
    expect(page).to_not have_content "Dragonball Z"
  end

  scenario "user does a case-insensitive search" do
    fill_in "search", with: "z"
    click_button "Search"

    expect(page).to have_content "Dragonball Z"
  end
end
