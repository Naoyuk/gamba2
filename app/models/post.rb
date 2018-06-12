class Post < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :crag
  belongs_to :area
  belongs_to :route

  validates :user_id, presence: true
  validates :region_id, presence: true
  validates :crag_id, presence: true
  validates :area_id, presence: true
  validates :route_id, presence: true
  validates :day, presence: true
  validates :result, presence: true
  validates :caption, presence: true

  mount_uploader :picture,  PictureUploader
end
