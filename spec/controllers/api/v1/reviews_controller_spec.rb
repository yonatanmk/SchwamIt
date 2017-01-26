require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "DELETE #destroy" do
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

    it "should delete the review" do
      delete :destroy, params: { id: recess_review_3.id }
      reviews = Review.all.map { |review| review.id }

      expect(reviews.length).to eq(2)
      expect(reviews.find { |id| id == recess_review_3.id }).to be(nil)
    end
  end
end
