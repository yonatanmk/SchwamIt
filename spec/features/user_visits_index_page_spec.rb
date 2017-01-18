require "rails_helper"

feature "user visits index page" do
  scenario "user can see list of nineties items" do

    Item.create(title: 'Pokemon', description: 'Gotta Catch \'Em All')
    Item.create(title: 'Y2K', description: 'AHHHHHHHHHHH!')

    visit items_path
    expect(page).to have_content "All The Nineties Things"

    expect(page).to have_content "Pokemon"
    expect(page).to have_content "Y2K"
  end
end
