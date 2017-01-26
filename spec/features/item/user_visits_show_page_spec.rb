require "rails_helper"

feature "user visits show page" do
  xscenario "user can get to and from show page from index" do

    date = DateTime.new(1995, 3, 4)
    user = User.create(username: 'stevesteve', email: 'steve@gmail.com', encrypted_password: 'rgtsahhtjhertrhaetshartn', created_at: date, updated_at: date)

    Item.create(title: 'Y2K', description: 'AHHHHHHHHHHH!', user: user)
    Item.create(title: 'Pokemon', description: 'Gotta Catch \'Em All', user: user)

    visit items_path
    # expect(page).to have_content "All The Nineties Things"

    visit "/items/#{Item.last.id}"

    expect(page).to have_content 'Gotta Catch \'Em All'
    expect(page).to have_content '2017'
    expect(page).to have_content 'Back'

    click_link 'Back'
    expect(page).to have_content 'All The Nineties Things'
  end
end
