# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Blake"
    uid "abc123"
    provider "twitter"
    admin false
    id 1
  end

  factory :user1, class: User do
    name "Blake"
    uid "abc598"
    provider "twitter"
    admin false
    id 2
  end

factory :admin, class: User do
    name "Blake"
    uid "bleepbloop"
    provider "twitter"
    admin true
    id 3
  end
end
