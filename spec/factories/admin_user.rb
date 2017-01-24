FactoryGirl.define do
  factory :admin_user do
    email 'admin@admin.com'
    first_name 'Admin'
    last_name 'Adminsson'
    password 'password'
  end
end