# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    date "2014-02-11"
    time "10:00:31"
    name "MyString"
    description "MyString"
    host_id 1
    id 1
  end

  factory :event1, class: Event do
    date "2014-02-11"
    time "10:00:31"
    name "Tool Time"
    description "MyString"
    host_id 2
    id 2
  end
end
