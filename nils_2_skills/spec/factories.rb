# FactoryGirl factories
FactoryGirl.define do
  factory :admin, class: User do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.Zone.today
  end

  factory :user do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
  end
end
