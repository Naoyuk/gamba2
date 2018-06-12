FactoryGirl.define do
  factory :post do
    day "2018-05-31"
    result "MyString"
    caption "MyText"
    picture Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/image.jpg'))
    association :user
    association :region
    association :crag
    association :area
    association :route
  end
end
