FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@example.com"}
    sequence(:username) {|n| "person#{n}"}
    password 'robotpassword'
  end
end
