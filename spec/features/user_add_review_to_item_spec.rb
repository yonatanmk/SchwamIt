require "rails_helper"

feature "user creates a review for an item" do
  before(:each) do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'

    fill_in 'Electronic Mail', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

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

    expect(page).to have_content "Body can't be blank"
    expect(page).to have_content "Rating can't be blank"
  end

  scenario "users are able to delete reviews they have created" do

  end

  scenario "users are not able to delete reviews they did not create" do
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
