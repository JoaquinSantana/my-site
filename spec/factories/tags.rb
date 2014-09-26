# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    sequence(:tagid, 1000)  { |n| n + 1 }
    nazwa "MyString"
    title "MyString"
    description "MyString"
    body "MyText"
    url "MyString"
    source_url "MyString"
    preview "MyString"
    foto "MyString"
  end
end
