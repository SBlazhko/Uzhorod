FactoryGirl.define do
  factory :follow do
    follover_id 1
    followed_id 1
  end

  factory :user do
    sequence(:email) {|n| "example#{n}@mail.com"}
    last_name "test5"
    first_name "Andy"
    password "1111"
  end

  factory :user2 do
    sequence(:email) {|n| "example#{n}@mail.com"}
    # sequence(:last_name) {|n| "test#{n}"}
    # email Faker::Internet.email
    last_name Faker::Name.name
    first_name Faker::Name.name
    password "1111"
  end

  factory :post do
    title "Hello World"
    content "Testing is the best features in the world"
  end

factory :random, class: User do
    email Faker::Internet.email
    last_name Faker::Name.name
    first_name Faker::Name.name
    password Faker::Name.name
end




























end
