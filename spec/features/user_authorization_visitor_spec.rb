require "rails_helper"

feature "Visitor authorization" do
  before(:each) do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:item, user: user)
  end

  scenario "visitor navigates to the index page" do
    item = Item.first

    visit root_path

    expect(page).to have_content "Sign in to Submit a Thing"
    expect(page).to have_content item.title
    expect(page).to_not have_content "Submit a new 90s thing"
  end
  scenario "visitor navigates to an item's show page" do
    item = Item.first

    visit root_path
    click_link item.title

    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to_not have_link "Edit"
    expect(page).to_not have_link "Delete"
  end
  scenario "visitor paths to an item's show page" do
    item = Item.first

    visit item_path(item)

    expect(page).to have_content item.title
    expect(page).to have_content item.description
    expect(page).to_not have_link "Edit"
    expect(page).to_not have_link "Delete"
  end
end
