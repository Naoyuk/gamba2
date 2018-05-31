class Post < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :crag
  belongs_to :area
  belongs_to :route
end
