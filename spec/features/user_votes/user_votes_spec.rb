require 'rails_helper'

feature 'Like and Dislike' do
  before(:each) do
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user)
    review = Review.create(item: item, user: user, rating: 5, body: "Much Awesome")
    review.save
    sign_in user
    visit root_path
    click_link item.title
  end

  scenario 'user Likes a post first time' do
    click_link "Like"

    expect(find_by_id("score")).to have_content "1"
  end
  scenario 'user Likes a post twice' do
    click_link "Like"
    click_link "Like"

    expect(find_by_id("score")).to have_content "0"
  end
  scenario 'user Dislikes a post first time' do
    click_link "Dislike"

    expect(find_by_id("score")).to have_content "-1"
  end
  scenario 'user Dislikes a post twice' do
    click_link "Dislike"
    click_link "Dislike"

    expect(find_by_id("score")).to have_content "0"
  end
  scenario 'user Dislikes a post, then Likes it' do
    click_link "Dislike"
    click_link "Like"

    expect(find_by_id("score")).to have_content "1"
  end
  scenario 'user Likes a post, then Dislikes it' do
    click_link "Like"
    click_link "Dislike"

    expect(find_by_id("score")).to have_content "-1"
  end
end
