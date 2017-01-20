require "rails_helper"

feature "user visits index page" do
  scenario "user can see list of nineties items" do


    date = DateTime.new(1995, 3, 4)
    user = User.create(username: 'stevesteve', email: 'steve@gmail.com', encrypted_password: 'rgtsahhtjhertrhaetshartn', created_at: date, updated_at: date)

    Item.create(title: 'Pokemon', description: 'Gotta Catch \'Em All', user: user)
    Item.create(title: 'Y2K', description: 'AHHHHHHHHHHH!', user: user)

    visit items_path
    expect(page).to have_content "All The Nineties Things"

    expect(page).to have_content "Pokemon"
    expect(page).to have_content "Y2K"
  end
end
