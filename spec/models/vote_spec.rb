require 'rails_helper'

describe Vote, type: :model do
  it { should have_valid(:value).when(-1,0,1) }
  it { should_not have_valid(:value).when(nil, 10, -5, "five") }

  it "value should default to 0" do
    user = FactoryGirl.create(:user)
    item = FactoryGirl.create(:item, user: user)
    review = FactoryGirl.create(:review, user: user, item: item)
    vote = Vote.create(user: user, review: review)

    expect(vote.value).to eq(0)
  end
end
