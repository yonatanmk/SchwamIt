require "rails_helper"

feature "User edits an existing item" do
  scenario "user can can navigate to the edit form from the item's show page" do
    Item.create(title: 'Pokemon', description: 'Gotta Catch \'Em All')
    visit items_path
    click_link 'Pokemon'
    click_link 'Edit'

    expect(page).to have_content "Edit Pokemon"
  end
  scenario "form renders with fields populated with current properties" do
    Item.create(title: 'Pokemon', description: 'Gotta Catch \'Em All')
    visit items_path
    click_link 'Pokemon'
    click_link 'Edit'

    expect(find_field("Title").value).to eq "Pokemon"
    expect(find_field("Description").value).to eq "Gotta Catch 'Em All"
  end
  scenario "Edits item successfully" do
    pokemon = Item.create(title: 'Pokemon', description: 'Gotta Catch \'Em All')
    visit items_path
    click_link 'Pokemon'
    click_link 'Edit'

    fill_in "Title", with: "Pokemon Red & Blue"
    click_button "Update Item"

    expect(page).to have_content "Pokemon Red & Blue"
    expect(page).to have_current_path(item_path(pokemon))
  end
  scenario "Edits item unsuccessfully" do
    pokemon = Item.create(title: 'Pokemon', description: 'Gotta Catch \'Em All')
    visit items_path
    click_link 'Pokemon'
    click_link 'Edit'

    fill_in "Title", with: ""
    click_button "Update Item"

    expect(page).to have_content "Edit Pokemon"
    expect(find_field("Title").value).to eq ""
    expect(find_field("Description").value).to eq "Gotta Catch 'Em All"
  end
end
