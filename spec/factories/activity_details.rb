FactoryGirl.define do
  factory :activity_detail do
    file_attachment "MyString"
    association :activity
  end
end
