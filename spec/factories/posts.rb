FactoryGirl.define do
  factory :post do
    day "2018-05-31"
    result "MyString"
    caption "MyText"
    association :user
    association :region
    association :crag
    association :area
    association :route
  end
end
