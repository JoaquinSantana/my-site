FactoryGirl.define do
  factory :post do
    title "First Post"
    description "Post description"
    body  "Body Post"
    user
  end
end