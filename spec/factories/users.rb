# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Blake"
    uid "abc123"
    provider "twitter"
    admin false
  end

  factory :user1, class: User do
    name "Blake"
    uid "abc123"
    provider "twitter"
    admin false
  end

factory :admin, class: User do
    name "Blake"
    uid "abc123"
    provider "twitter"
    admin true
  end
end
