class Fav < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :favs_count
  validates :user_id, presence: true
  validates :post_id, presence: true

end
