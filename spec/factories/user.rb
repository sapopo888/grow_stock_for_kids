FactoryBot.define do
  factory :user do
    name { "ユーザー" }
    sequence(:email) { |n| "user_#{n}@example.com" }
    status { 0 }
    password { "password" }
    password_confirmation { "password" }
  end
end
