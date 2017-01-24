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
    review = Review.first
    find_by_id("like-#{review.id}").trigger('click')

    expect(find(".review")).to have_content "1"
  end
  scenario 'user Likes a post twice' do
    review = Review.first
    find_by_id("like-#{review.id}").trigger('click')
    find_by_id("like-#{review.id}").trigger('click')

    expect(find(".review")).to have_content "0"
  end
  scenario 'user Dislikes a post first time' do
    review = Review.first
    find_by_id("dislike-#{review.id}").trigger('click')

    expect(find(".review")).to have_content "-1"
  end
  scenario 'user Dislikes a post twice' do
    review = Review.first
    find_by_id("dislike-#{review.id}").trigger('click')
    find_by_id("dislike-#{review.id}").trigger('click')

    expect(find(".review")).to have_content "0"
  end
  scenario 'user Dislikes a post, then Likes it' do
    review = Review.first
    find_by_id("dislike-#{review.id}").trigger('click')
    find_by_id("like-#{review.id}").trigger('click')

    expect(find(".review")).to have_content "1"
  end
  scenario 'user Likes a post, then Dislikes it' do
    review = Review.first
    find_by_id("like-#{review.id}").trigger('click')
    find_by_id("dislike-#{review.id}").trigger('click')

    expect(find(".review")).to have_content "-1"
  end
end
