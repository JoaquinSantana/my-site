# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contact do
    podpis "MyString"
    email "MyString"
    wiadomosc "MyText"
    nickname "MyString"
  end
end
