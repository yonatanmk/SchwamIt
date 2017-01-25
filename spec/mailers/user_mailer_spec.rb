require "rails_helper"

# RSpec.describe UserMailerMailer, type: :mailer do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

feature "mailer sends emails" do

  scenario "review a product" do
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user)
    user2 = FactoryGirl.create(:user)

    sign_in user2

    visit new_item_review_path(item)

    fill_in "Rating", with: "2"
    fill_in "Body", with: "_The_ best thing, ever!"
    click_button "Create Review"

    expect(page).to have_content("You reviewed a Thing")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

end
