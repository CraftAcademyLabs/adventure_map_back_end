FactoryGirl.define do
  factory :activity do
    title "MyString"
    body "MyText"
    difficulty 1
    category "MyString"
    association :user
  end
end
