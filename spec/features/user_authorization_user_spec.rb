require "rails_helper"

feature "User authorization" do
  before(:each) do
    user = FactoryGirl.create(:user)
    user2 = FactoryGirl.create(:user)
    FactoryGirl.create(:item, user: user)
    FactoryGirl.create(:item, user: user2)
    sign_in user
  end

  scenario "user navigates to the index page" do
    item = Item.first

    visit root_path

    expect(page).to have_content "Add a new Thing"
    expect(page).to have_content item.title
    expect(page).to_not have_content "Sign in to Submit a Thing"
  end
  scenario "user navigates to an item's show page they own" do
    item = Item.first

    visit root_path
    click_link item.title

    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to have_link "Edit"
    expect(page).to have_link "Delete"
  end
  scenario "user navigates to an item's show page they don't own" do
    item = Item.second

    visit root_path
    click_link item.title

    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to_not have_link "Edit"
    expect(page).to_not have_link "Delete"
  end
  scenario "user navigates to an item's edit page they own" do
    item = Item.first

    visit root_path
    click_link item.title
    click_link "Edit"

    expect(page).to have_link "Delete"
    expect(page).to have_button "Update Item"
  end
end
