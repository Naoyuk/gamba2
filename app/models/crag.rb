class Crag < ApplicationRecord
  belongs_to :region
  has_many :areas, ->{ order(:id) }
  has_many :routes, ->{ order(:id) }
end
