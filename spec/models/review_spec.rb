require 'rails_helper'

describe Review, type: :model do
  it { should have_valid(:rating).when(1,2,3,4,5) }
  it { should_not have_valid(:rating).when(nil, 0, 10, -5, "five") }

  it { should have_valid(:score).when(5, -4) }
  it { should_not have_valid(:score).when("five") }

  it { should have_valid(:body).when(nil, '', "Great") }

  it "score should default to 0" do
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user)
    review = FactoryGirl.create(:review, user: user, item: item)

    expect(review.score).to eq(0)
  end
end
