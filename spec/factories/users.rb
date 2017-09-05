FactoryGirl.define do
  factory :user do
    first_name 'Email'
    last_name 'Emailsson'
    nickname 'email'
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    gender %w(Male Female Other).sample
    city 'Gothenburg'
    date_of_birth 18.years.ago.strftime('%Y-%m-%d')
  end
end
