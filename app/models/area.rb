class Area < ApplicationRecord
  belongs_to :region
  belongs_to :crag
  has_many :routes, ->{ order(:id) }
end
