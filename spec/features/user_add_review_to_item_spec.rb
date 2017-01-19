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

  scenario "users are able to delete reviews they have created" do
    click_link 'Add Review'

    fill_in "Rating", with: 3
    fill_in "Body", with: "Review the first"
    click_button 'Create Review'
    click_link 'Delete Review'

    expect(page).to_not have_content "Review the first"
  end

  scenario "users are not able to delete reviews they did not create" do
    #test wil be revisisted after User Auth is implimented
  end

  scenario "users are able to edit reviews they have created" do
  end

  scenario "users are not able to edit reviews they have not created" do
  end

  scenario "upvotes increment the review score correctly" do
  end

  scenario "users are not able to upvote the same review more than once" do
  end

  scenario "downvotes decrement the review score correctly" do
  end

  scenario "users are not able to downvote the same review more than once" do
  end
end
