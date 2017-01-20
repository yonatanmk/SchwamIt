require "rails_helper"

feature "user creates a review for an item" do
  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in user

    visit new_item_path
    fill_in "Title", with: "Pokemon"
    fill_in "Description", with: "Gotta Catch 'Em All"
    click_button "Create Item"

    visit items_path
    click_link 'Pokemon'
  end

  scenario "users are able to delete reviews they have created" do
    click_link 'Add Review'

    fill_in "Rating", with: 3
    fill_in "Body", with: "Review the first"
    click_button 'Create Review'
    click_link 'Delete Review'

    expect(page).to_not have_content "Review the first"
  end
end
