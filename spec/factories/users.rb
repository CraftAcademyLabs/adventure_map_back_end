FactoryGirl.define do
  factory :user do
    email 'email@random.com'
    password 'password'
    password_confirmation 'password'
  end
end
