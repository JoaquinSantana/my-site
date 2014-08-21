# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    podpis "MyString"
    komentarz "MyText"
    post nil
  end
end
