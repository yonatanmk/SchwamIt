require "rails_helper"

feature "Admin can delete user" do
  scenario "admin deletes user" do
    admin = FactoryGirl.create(:user, role: "admin")
    user = FactoryGirl.create(:user, username: "chuck")
    sign_in admin
    visit user_path(user)

    expect(page).to_not have_content "chuck"
  end
end
