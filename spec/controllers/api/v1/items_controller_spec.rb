require "rails_helper"

RSpec.describe Api::V1::ItemsController, type: :controller do
  describe "GET #show" do
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

    it "should return the reviews of the current item and their authors, the current user" do
      sign_in tj
      get :show, params: { id: tj.id }
      json = JSON.parse(response.body)

      expect(json["reviews"].length).to eq(3)
      expect(json["reviews"][0]["rating"]).to eq(5)
      expect(json["reviews"][0]["body"]).to eq("Awesome cartoon")
      expect(json["reviews"][0]["score"]).to eq(0)
      expect(json["reviews"][0]["item_id"]).to eq(1)
      expect(json["reviews"][0]["user_id"]).to eq(1)

      expect(json["users"].length).to eq(3)
      expect(json["users"][0]["id"]).to eq(1)
      expect(json["users"][0]["username"]).to eq("TJ")
      expect(json["users"][0]["email"]).to eq("tjdetweiler@recess.com")

      expect(json["reviews"][2]["rating"]).to eq(4)
      expect(json["reviews"][2]["body"]).to eq("Great entertainment")
      expect(json["reviews"][2]["score"]).to eq(0)
      expect(json["reviews"][2]["item_id"]).to eq(1)
      expect(json["reviews"][2]["user_id"]).to eq(1)

      expect(json["users"][2]["id"]).to eq(1)
      expect(json["users"][2]["username"]).to eq("TJ")
      expect(json["users"][2]["email"]).to eq("tjdetweiler@recess.com")

      expect(json["currentUser"]["id"]).to eq(1)
      expect(json["currentUser"]["username"]).to eq("TJ")
      expect(json["currentUser"]["email"]).to eq("tjdetweiler@recess.com")

    end
  end
end
