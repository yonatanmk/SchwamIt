FactoryGirl.define do
  factory :item do
    sequence(:title) {|n| "Pokemon#{n}"}
    sequence(:description) {|n| "Gotta Catch'em All#{n}"}
  end
end
