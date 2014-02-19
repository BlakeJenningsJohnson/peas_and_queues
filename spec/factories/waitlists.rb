# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :waitlist do
    user_id 1
    tool_id 1
  end

  factory :waitlist1, class: Waitlist do
    user_id 2
    tool_id 1
  end

   factory :waitlist2, class: Waitlist do
    user_id 2
    tool_id 2
  end

  factory :waitlist_with_tool, class: Waitlist do
    user
    tool
  end
end
