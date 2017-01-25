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

  scenario "users see reviews on show page once they are made" do
    click_link 'Add Review'

    fill_in "Rating", with: 3
    fill_in "Body", with: "Review the first"
    click_button 'Create Review'

    expect(page).to have_content "Pokemon"
    expect(page).to have_content 3
    expect(page).to have_content "Review the first"
  end

  scenario "user unsuccessfully adds a review" do
    click_link 'Add Review'
    click_button 'Create Review'

    expect(page).to have_content "Rating can't be blank"
  end
end
