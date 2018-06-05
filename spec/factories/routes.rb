FactoryGirl.define do
  factory :route do
    name "testRoute"
    grade "V1"
    style 1
    rate 1
    association :region
    association :crag
    association :area
  end
end
