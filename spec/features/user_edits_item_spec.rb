require "rails_helper"

feature "User edits an existing item" do

  before(:each) do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'birdman'
    fill_in 'Electronic Mail', with: 'birdie@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'Confirm Password', with: 'password'
    click_button 'Sign Up'

    visit new_item_path
    fill_in "Title", with: "Pokemon"
    fill_in "Description", with: "Gotta Catch 'Em All"
    click_button "Create Item"

    visit items_path
    click_link 'Pokemon'
    click_link 'Edit'
  end


  scenario "user can navigate to the edit form from the item's show page" do
    expect(page).to have_content "Edit Pokemon"
  end

  scenario "form renders with fields populated with current properties" do
    expect(find_field("Title").value).to eq "Pokemon"
    expect(find_field("Description").value).to eq "Gotta Catch 'Em All"
  end

  scenario "Edits item successfully" do
    visit items_path
    click_link 'Pokemon'
    click_link 'Edit'

    fill_in "Title", with: "Pokemon Red & Blue"
    click_button "Update Item"
    expect(page).to have_content "Pokemon Red & Blue"
    expect(page).to have_current_path(item_path(Item.first))
  end

  scenario "Edits item unsuccessfully" do
    fill_in "Title", with: ""
    click_button "Update Item"
    expect(page).to have_content "Edit Pokemon"
    expect(find_field("Title").value).to eq ""
    expect(find_field("Description").value).to eq "Gotta Catch 'Em All"
  end
end
