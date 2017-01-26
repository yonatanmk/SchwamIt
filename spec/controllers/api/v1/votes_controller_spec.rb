require "rails_helper"

RSpec.describe Api::V1::VotesController, type: :controller do
  let(:tj) {
    User.create( email: "tjdetweiler@recess.com",
    username: "TJ",
    password: "123456")
  }
  let(:finster) {
    User.create(email: "finster@recess.com",
    username: "Ms. Finster",
    password: "123456")
  }
  let(:recess)  { Item.create(
    title: "Recess",
    description: "The best group of elementary school kids",
    user: tj)
  }
  let!(:recess_review_1) {
    Review.create(
    item: recess,
    rating: 5,
    body: "Awesome cartoon",
    user: tj)
  }
  let!(:recess_review_2)  {
    Review.create(
    item: recess,
    rating: 1,
    body: "Stupid kids",
    user: finster)
  }
  let!(:recess_review_3)  {
    Review.create(
    item: recess,
    rating: 4,
    body: "Great entertainment",
    user: tj)
  }

  before(:each) do
    sign_in tj
  end

  describe "POST #up_vote" do
    describe "user has not yet voted" do
      it "should set the score to 1" do
        post :up_vote, params: { review_id: recess_review_1.id }
        expect(Review.find(recess_review_1.id).score).to eq(1)
      end
    end
    describe "user has already upvoted" do
      it "should reset the score to 0" do
        post :up_vote, params: { review_id: recess_review_1.id }
        post :up_vote, params: { review_id: recess_review_1.id }
        expect(Review.find(recess_review_1.id).score).to eq(0)
      end
    end
    describe "user has already downvoted" do
      it "should set the score to 1" do
        post :down_vote, params: { review_id: recess_review_1.id }
        post :up_vote, params: { review_id: recess_review_1.id }
        expect(Review.find(recess_review_1.id).score).to eq(1)
      end
    end
  end

  describe "POST #down_vote" do
    describe "user has not yet voted" do
      it "should set the score to -1" do
        post :down_vote, params: { review_id: recess_review_1.id }
        expect(Review.find(recess_review_1.id).score).to eq(-1)
      end
    end
    describe "user has already upvoted" do
      it "should set the score to -1" do
        post :up_vote, params: { review_id: recess_review_1.id }
        post :down_vote, params: { review_id: recess_review_1.id }
        expect(Review.find(recess_review_1.id).score).to eq(-1)
      end
    end
    describe "user has already downvoted" do
      it "should reset the score to 0" do
        post :down_vote, params: { review_id: recess_review_1.id }
        post :down_vote, params: { review_id: recess_review_1.id }
        expect(Review.find(recess_review_1.id).score).to eq(0)
      end
    end
  end
end
