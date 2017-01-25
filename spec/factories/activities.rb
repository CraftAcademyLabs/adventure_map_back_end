FactoryGirl.define do
  factory :activity do
    title 'Title'
    body 'Lorem ipsum...'
    difficulty 1
    category 'Hiking'
    association :user
  end
end
