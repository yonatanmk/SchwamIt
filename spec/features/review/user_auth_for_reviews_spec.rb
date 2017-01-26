require "rails_helper"

xfeature "User authorization for reviews" do
  before(:each) do
    user = FactoryGirl.create(:user)
    admin = FactoryGirl.create(:user, role: "admin")
    item = FactoryGirl.create(:item, user: user)
    review = FactoryGirl.create(:review, item: item, user: user)
  end

  scenario "users can't add a review without signing in" do
    item = Item.first

    visit root_path
    click_link item.title

    expect(page).to_not have_content "Add Review"
  end

  scenario "users can add a review when signed in" do
    item = Item.first
    user = User.first

    sign_in user
    visit root_path
    click_link item.title

    expect(page).to have_content "Add Review"
  end

  scenario "users that did't write a review can't modify it" do
    item = Item.first

    visit root_path
    click_link item.title

    expect(page).to_not have_content "Edit Review"
    expect(page).to_not have_content "Delete Review"
  end

  scenario "users that wrote a review can modify it" do
    item = Item.first
    user = User.first

    sign_in user
    visit root_path
    click_link item.title

    expect(page).to have_content "Edit Review"
    expect(page).to have_content "Delete Review"
  end

  scenario "Admins can modify reviews" do
    item = Item.first
    user = User.last

    sign_in user
    visit root_path
    click_link item.title

    expect(page).to have_content "Edit Review"
    expect(page).to have_content "Delete Review"
  end
end
