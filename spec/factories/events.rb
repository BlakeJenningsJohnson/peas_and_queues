# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    date "2014-02-11"
    time "10:00:31"
    name "MyString"
    description "MyString"
  end
end
