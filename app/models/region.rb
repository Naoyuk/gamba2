class Region < ApplicationRecord
  has_many :crags, ->{ order(:id) }
  has_many :areas, ->{ order(:id) }
  has_many :routes, ->{ order(:id) }
end
