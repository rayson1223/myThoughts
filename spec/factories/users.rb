FactoryGirl.define do
  factory :user do
    username                "tester"
    email                   "tester@gmail.com"
    password                "123123123"
    password_confirmation   "123123123"
  end
end
