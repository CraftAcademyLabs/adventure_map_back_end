FactoryGirl.define do
  factory :activity_detail do
    file_attachment "MyString"
    association :activity
    type %w(Recording Waypoint Image).sample
  end
end
