class Post < ApplicationRecord
  belongs_to :user
  belongs_to :region
  belongs_to :crag
  belongs_to :area
  belongs_to :route

  has_many :favs, dependent: :destroy
  has_many :fav_users, through: :favs, source: :user

  validates :user_id, presence: true
  validates :region_id, presence: true
  validates :crag_id, presence: true
  validates :area_id, presence: true
  validates :route_id, presence: true
  validates :day, presence: true
  validates :result, presence: true
  validates :caption, presence: true

  mount_uploader :picture,  PictureUploader

  def fav(user)
    favs.create(user_id: user.id)
  end

  def unfav(user)
    favs.find_by(user_id: user.id).destroy
  end

  def fav?(user)
    fav_users.include?(user)
  end
end
