FactoryGirl.define do
  factory :user do
    name 'Email'
    nickname 'email'
    email 'email@random.com'
    password 'password'
    password_confirmation 'password'
    gender %w(Male Female Other).sample
    city 'Gothenburg'
    date_of_birth 20.years.ago.strftime('%Y-%m-%d')
  end
end
