require "rails_helper"

feature "Admin views user list" do
  scenario "admin can see user list" do
    admin = FactoryGirl.create(:user, role: "admin")
    sign_in admin
    visit users_path

    expect(page).to have_content "person"
  end
  scenario "Non-admin can not see user list" do
    visit users_path
    expect(page).to_not have_content "person"
  end
end
