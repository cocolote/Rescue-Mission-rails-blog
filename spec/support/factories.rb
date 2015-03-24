FactoryGirl.define do
  factory :question do
    title 'This is a question that has to be 40 characters or longer'
    description ' description' * 13
    user_id 1
  end
end
