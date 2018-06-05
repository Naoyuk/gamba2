class Crag < ApplicationRecord
  belongs_to :region
  has_many :areas
end
