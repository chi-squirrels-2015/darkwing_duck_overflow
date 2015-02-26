# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    title "MyString"
    content "MyText"
    vote_count 1
    user_id 1
  end
end
