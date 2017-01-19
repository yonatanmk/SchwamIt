require "rails_helper"

feature "User deletes an existing item" do
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
  end

  scenario "users can choose to delete from the item's show page" do
    expect(find_link('Delete').visible?).to eq true
  end

  scenario "users can succesfully delete from the item's show page" do
    click_link 'Delete'

    expect(page).to have_no_content "Pokemon"
    expect(page).to have_content "You deleted a Thing"
    expect(page).to have_current_path(items_path)
  end

  scenario "users can choose to delete from the item's edit page" do
    click_link 'Edit'

    expect(find_link('Delete').visible?).to eq true
  end

  scenario "users can succesfully delete from the item's edit page" do
    click_link 'Edit'
    click_link 'Delete'

    expect(page).to have_no_content "Pokemon"
    expect(page).to have_content "You deleted a Thing"
    expect(page).to have_current_path(items_path)
  end
end
