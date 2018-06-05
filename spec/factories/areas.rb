FactoryGirl.define do
  factory :area do
    name "testArea"
    association :region
    association :crag
  end
end
