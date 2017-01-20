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

  scenario "users are able to edit reviews they have created" do
    click_link 'Add Review'

    fill_in "Rating", with: 3
    fill_in "Body", with: "Review the first"
    click_button 'Create Review'

    click_link 'Edit Review'

    fill_in "Body", with: "Edited review the first"
    click_button 'Update Review'

    expect(page).to have_content "Edited review the first"
  end

  scenario "user unsuccessfully edit a review" do
    click_link 'Add Review'

    fill_in "Rating", with: 3
    fill_in "Body", with: "Review the first"
    click_button 'Create Review'

    click_link 'Edit Review'

    fill_in "Rating", with: 7
    click_button 'Update Review'

    expect(page).to have_content "Rating must be"
  end
end
