# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tool do
    image "MyString"
    name "hammer"
    description "Why do I need a hammer?"
    available true
  end
end
