FactoryGirl.define do
  factory :review do
    rating 3
    sequence(:body) {|n| "Review ##{n}"}
  end
end
