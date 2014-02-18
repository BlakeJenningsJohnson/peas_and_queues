# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tool do
    image "MyString"
    name "hammer"
    description "Why do I need a hammer?"
    user_id nil
    available true
  end

    factory :tool2, class: Tool do
    image "MyString"
    name "shovel"
    description "Picks up dirt?"
    user_id 2
    available false
  end
end
