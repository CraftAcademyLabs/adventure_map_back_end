FactoryGirl.define do
  factory :activity_detail do
    file_attachment 'http://validurl.com'
    association :activity
    attachment_type ActivityDetail::VALID_TYPE_VALUES.sample
  end
end
