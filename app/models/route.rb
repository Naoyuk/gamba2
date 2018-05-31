class Route < ApplicationRecord
  belongs_to :region
  belongs_to :crag
  belongs_to :area
end
