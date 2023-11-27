class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :reactions
  validates :track_id, presence: true
  validates :mood, presence: true
  MOODS = %i[]
end
